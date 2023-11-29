import 'package:SportRabbit/models/lesson_model.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/models/program_type.dart';
import 'package:SportRabbit/services/graphql_services/drills_services/DrillsService.dart';
import 'package:json_annotation/json_annotation.dart';

// make json to dart of drill
@JsonSerializable()
class DrillModel {
  int? id;
  String? title;
  int? duration;
  // object of category
  GameModel? game;
  int? gameId;
  String? thumbnail;
  bool? isPublished;
  String? difficulty;
  // list of activities
  List<LessonModel>? lessons;
  // reference of lesson aggregate
  LessonInfo? lessonInfo;
  // reference of program type
  ProgramType? programType;

  // constructor is firt method of class which is called when object is created
  DrillModel(
      {this.id,
      this.title,
      this.duration,
      // reference of game
      this.game,
      this.gameId,
      this.thumbnail,
      this.isPublished,
      this.difficulty,
      // list of activities
      this.lessons = const [],
      // reference of program type
      this.programType,
      this.lessonInfo});

  // factory is a method which is used to return object from json to dart model
  factory DrillModel.fromJson(Map<String, dynamic> json) => DrillModel(
      id: json["id"] as int?,
      title: json["title"] as String?,
      duration: json["duration"] as int?,
      // referece of game
      game: json["game"] == null ? null : GameModel.fromJson(json["game"]),
      // reference of lessons
      lessons: json["lessons"] == null
          ? null
          : (json["lessons"] as List<dynamic>)
              .map((e) => LessonModel.fromJson(e as Map<String, dynamic>))
              .toList(),

      // reference of lesson aggregate
      lessonInfo: json["lessons_aggregate"] == null
          ? null
          : LessonInfo.fromJson(json["lessons_aggregate"]),

      // reference of program type
      programType: json["program_type"] == null
          ? null
          : ProgramType.fromJson(json["program_type"]));
}

class LessonInfo {
  int? count;
  int? totalMinutes;
  double? averageLessonMinutes;

  LessonInfo({this.count, this.totalMinutes, this.averageLessonMinutes});

  factory LessonInfo.fromJson(Map<String, dynamic> json) => LessonInfo(
      count: json["aggregate"]["count"] as int,
      totalMinutes: json["aggregate"]["sum"]["duration"] as int,
      averageLessonMinutes: json["aggregate"]["avg"]["duration"] as double);
}
