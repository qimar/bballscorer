/*
 {
        "id": 2,
        "title": "Basketball",
        "ispublished": true,
        "difficulty": null,
        "duration": "12 weeks",
        "price": null,
        "program_type_id": 2
      }
*/

// make json to dart of category
// https://javiercbk.github.io/json_to_dart/
//
import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/models/program_type.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GameModel {
  int? id;
  String? title;
  String? thumbnail;
  bool? isPublished;
  String? difficulty;
  String? duration;
  String? price;
  int? programTypeId;
  // list of drills
  List<DrillModel>? drills;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  GameModel(
      {this.id,
      this.title,
      this.thumbnail,
      this.isPublished,
      this.difficulty,
      this.duration,
      this.price,
      this.programTypeId,
      // list of drills
      this.drills,
      // reference of program type
      this.programType});

// getter concatenate duration and difficulty
  String get difficultyAndDuration {
    return "$difficulty - $duration";
  }

  // factory is a method which is used to return object from json to dart model
  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        id: json["id"] as int?,
        title: json["title"] as String?,
        thumbnail: json["thumbnail"] as String?,
        isPublished: json["ispublished"] as bool?,
        difficulty: json["difficulty"] as String?,
        duration: json["duration"] as String?,
        price: json["price"] as String?,
        programTypeId: json["program_type_id"] as int?,
        // list of drills
        drills: json["drills"] == null
            ? null
            : List<DrillModel>.from(
                json["drills"].map((x) => DrillModel.fromJson(x))),
        // reference of program type
        programType: json["program_type"] == null
            ? null
            : ProgramType.fromJson(json["program_type"]),
      );
}
