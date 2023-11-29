import 'package:SportRabbit/common/colors.dart';
import 'package:SportRabbit/common/widgets/CachedNetworkImageWidget.dart';
import 'package:SportRabbit/common/widgets/program_type_labe_widget.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/providers/DrillsProvider.dart';
import 'package:SportRabbit/screens/drills_list/drills_list.dart';
import 'package:SportRabbit/screens/games_list/widgets/game_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameListItemWidet extends StatelessWidget {
  final GameModel game;
  const GameListItemWidet({super.key, required this.game});

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
                  // game thumbnail image
                  Expanded(
                      child: GestureDetector(
                          onTapUp: (details) {
                            // set selected game
                            Provider.of<DrillsProvider>(context, listen: false)
                                .selectedGame = game;
                            // Navigate to drill list screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DrillsListView()));
                          },
                          child: CachedNetworkImageWidget(
                              imageUrl: game.thumbnail!))),
                  // game title and duration and join program button
                  GameTitleWidget(game: game),
                ]))),
        // game program type
        ProgramTypeLabelWidget(programType: game.programType!),
      ],
    );
  }
}
