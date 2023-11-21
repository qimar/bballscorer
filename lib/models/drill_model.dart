import 'package:SportRabbit/models/lesson_model.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/models/program_type.dart';
import 'package:json_annotation/json_annotation.dart';

// make json to dart of drill
@JsonSerializable()
class DrillModel {
  int? id;
  String? name;
  int? duration;
  // object of category
  GameModel? category;
  // list of activities
  List<LessonModel>? activities;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  DrillModel(
      {this.id,
      this.name,
      this.duration,
      // reference of category
      this.category,
      // list of activities
      this.activities = const [],
      // reference of program type
      this.programType});

  // factory is a method which is used to return object from json to dart model
  factory DrillModel.fromJson(Map<String, dynamic> json) => DrillModel(
      id: json["id"],
      name: json["title"],
      duration: json["duration"],
      category: GameModel.fromJson(json["category"]),
      activities: List<LessonModel>.from(
          json["activities"].map((x) => LessonModel.fromJson(x))),
      programType: ProgramType.fromJson(json["program_type"]));

  // toJson is a method which is used to return json from dart model
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": name,
        "duration": duration,
        "category": category?.toJson(),
        "activities": List<dynamic>.from(activities!.map((x) => x.toJson())),
        "program_type": programType?.toJson(),
      };
}
