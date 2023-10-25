import 'package:counterapp/models/drill.dart';

/**
 * {
                "id": 2,
                "thumbnail": "jj",
                "title": "Free Throw Shooting",
                "video_url": "jj",
                "description": "Practising Free throw shots from Foul Line. "
              },
 */
// create json to dart of activity
// https://javiercbk.github.io/json_to_dart/
class Activity {
  int id;
  String thumbnail;
  String title;
  String videoUrl;
  String description;
  // reference of drill
  Drill drill;

  // constructor is firt method of class which is called when object is created
  Activity(
      {required this.id,
      required this.thumbnail,
      required this.title,
      required this.videoUrl,
      required this.description,
      // reference of drill
      required this.drill});

  // factory is a method which is used to return object from json to dart model
  factory Activity.fromJson(Map<String, dynamic> json) => Activity(
        id: json["id"],
        thumbnail: json["thumbnail"],
        title: json["title"],
        videoUrl: json["video_url"],
        description: json["description"],
        drill: Drill.fromJson(json["drill"]),
      );

  // toJson is a method which is used to return json from dart model
  Map<String, dynamic> toJson() => {
        "id": id,
        "thumbnail": thumbnail,
        "title": title,
        "video_url": videoUrl,
        "description": description,
        "drill": drill.toJson()
      };
}
