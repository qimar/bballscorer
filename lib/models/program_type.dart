import 'package:SportRabbit/models/activity.dart';
import 'package:SportRabbit/models/category.dart';
import 'package:SportRabbit/models/drill.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProgramType {
  int? id;
  bool? value;
  double? price;
  String? title;
  List<Activity>? activities;
  List<Category>? categories;
  List<Drill>? drills;

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
        activities: List<Activity>.from(
            json["activities"].map((x) => Activity.fromJson(x))),
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        drills: List<Drill>.from(json["drills"].map((x) => Drill.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "value": value,
        "price": price,
        "title": title,
      };
}
