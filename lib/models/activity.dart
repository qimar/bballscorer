import 'package:counterapp/models/drill.dart';
import 'package:counterapp/models/program_type.dart';

class Activity {
  int? id;
  String? thumbnail;
  String? title;
  String? videoUrl;
  String? description;
  // object of drill
  Drill? drill;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  Activity(
      {this.id,
      this.thumbnail,
      this.title,
      this.videoUrl,
      this.description,
      // reference of drill
      this.drill,
      // reference of program type
      this.programType});

  // factory is a method which is used to return object from json to dart model
  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        videoUrl: json["video_url"],
        description: json["description"],
        drill: Drill.fromJson(json["drill"]),
        programType: ProgramType.fromJson(json["program_type"]),
      );

  // toJson is a method which is used to return json from dart model
  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "title": title,
        "video_url": videoUrl,
        "description": description,
        "drill": drill?.toJson(),
        "program_type": programType?.toJson(),
      };
}
