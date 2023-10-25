import 'package:counterapp/models/activity.dart';
import 'package:counterapp/models/category.dart';
import 'package:counterapp/models/program_type.dart';

// make json to dart of drill
class Drill {
  int? id;
  String? name;
  int? duration;
  // object of category
  Category? category;
  // list of activities
  List<Activity>? activities;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  Drill(
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
  factory Drill.fromJson(Map<String, dynamic> json) => Drill(
      id: json["id"],
      name: json["title"],
      duration: json["duration"],
      category: Category.fromJson(json["category"]),
      activities: List<Activity>.from(
          json["activities"].map((x) => Activity.fromJson(x))),
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
