import 'package:SportRabbit/common/colors.dart';
import 'package:SportRabbit/common/widgets/CachedNetworkImageWidget.dart';
import 'package:SportRabbit/common/widgets/program_type_labe_widget.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/screens/games_list/widgets/game_title_widget.dart';
import 'package:flutter/material.dart';

class DrillListItemWidet extends StatelessWidget {
  final GameModel game;
  final int index;
  const DrillListItemWidet(
      {super.key, required this.game, required this.index});

  @override
  Widget build(BuildContext context) {
    double borderRadius = 25;
    return Stack(
      children: [
        // game card container
        Container(
            margin: const EdgeInsets.only(top: 6, bottom: 6),
            decoration: BoxDecoration(
              color: appMainColor,
              borderRadius: BorderRadius.circular(borderRadius),
              // border: Border.all(color: Colors.grey),
            ),
            height: MediaQuery.of(context).size.height * 0.32,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: Column(children: [
                  Expanded(
                      child:
                          CachedNetworkImageWidget(imageUrl: game.thumbnail!)),
                  GameTitleWidget(game: game, index: index),
                ]))),
        // game program type
        ProgramTypeLabelWidget(programType: game.programType!),
      ],
    );
  }
}
