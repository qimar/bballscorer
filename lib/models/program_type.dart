import 'package:SportRabbit/models/lesson_model.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/models/drill_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProgramType {
  int? id;
  bool? value;
  double? price;
  String? title;
  List<LessonModel>? activities;
  List<GameModel>? categories;
  List<DrillModel>? drills;

  ProgramType({
    this.id,
    this.value,
    this.price,
    this.title,
    this.activities = const [],
    this.categories = const [],
    this.drills = const [],
  });

  factory ProgramType.fromJson(Map<String, dynamic> json) => ProgramType(
        id: json["id"],
        value: json["value"],
        price: json["price"],
        title: json["title"],
        activities: List<LessonModel>.from(
            json["activities"].map((x) => LessonModel.fromJson(x))),
        categories: List<GameModel>.from(
            json["categories"].map((x) => GameModel.fromJson(x))),
        drills: List<DrillModel>.from(
            json["drills"].map((x) => DrillModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "price": price,
        "title": title,
      };
}
