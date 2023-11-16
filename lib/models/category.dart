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
import 'package:counterapp/models/drill.dart';
import 'package:counterapp/models/program_type.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Category {
  int? id;
  String? title;
  bool? isPublished;
  String? difficulty;
  String? duration;
  double? price;
  int? programTypeId;
  // list of drills
  List<Drill>? drills;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  Category(
      {this.id,
      this.title,
      this.isPublished,
      this.difficulty,
      this.duration,
      this.price,
      this.programTypeId,
      // list of drills
      this.drills,
      // reference of program type
      this.programType});

  // factory is a method which is used to return object from json to dart model
  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
        isPublished: json["ispublished"],
        difficulty: json["difficulty"],
        duration: json["duration"],
        price: json["price"],
        programTypeId: json["program_type_id"],
        // list of drills
        drills: List<Drill>.from(json["drills"].map((x) => Drill.fromJson(x))),
        // reference of program type
        programType: ProgramType.fromJson(json["program_type"]),
      );

  // toJson is a method which is used to return json from dart model
  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "ispublished": isPublished,
        "difficulty": difficulty,
        "duration": duration,
        "price": price,
        "program_type_id": programTypeId,
        // list of drills
        "drills": List<dynamic>.from(drills!.map((x) => x.toJson())),
        // reference of program type
        "program_type": programType?.toJson(),
      };
}
