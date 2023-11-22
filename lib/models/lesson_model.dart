import 'package:SportRabbit/models/drill_model.dart';
import 'package:SportRabbit/models/program_type.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LessonModel {
  int? id;
  int? drillId;
  String? title;
  String? description;
  String? thumbnail;
  String? videoUrl;
  int? programTypeId;
  bool? isPublished;
  String? difficulty;
  int? duration;
  // object of drill
  DrillModel? drill;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  LessonModel(
      {this.id,
      this.drillId,
      this.title,
      this.description,
      this.thumbnail,
      this.videoUrl,
      this.programTypeId,
      this.isPublished,
      this.difficulty,
      this.duration,
      // reference of drill
      this.drill,
      // reference of program type
      this.programType});

  // factory is a method which is used to return object from json to dart model
  factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        videoUrl: json["video_url"],
        description: json["description"],
        drill: json["drill"] == null
            ? null
            : DrillModel.fromJson(json["drill"] as Map<String, dynamic>),
        programType: json["program_type"] == null
            ? null
            : ProgramType.fromJson(json["program_type"]),
      );
}
