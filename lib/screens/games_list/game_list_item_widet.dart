import 'package:SportRabbit/common/widgets/CachedNetworkImageWidget.dart';
import 'package:SportRabbit/models/game_model.dart';
import 'package:SportRabbit/screens/games_list/game_title_widget.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class GameListItemWidet extends StatelessWidget {
  final GameModel game;
  GameListItemWidet({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    double borderRadius = 15;
    return Container(
        margin: const EdgeInsets.only(top: 6, bottom: 6),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(borderRadius),
          // border: Border.all(color: Colors.grey),
        ),
        height: MediaQuery.of(context).size.height * 0.32,
        width: MediaQuery.of(context).size.width,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(borderRadius),
            child: Column(
              children: [
                Expanded(
                    child: CachedNetworkImageWidget(imageUrl: game.thumbnail!)),
                GameTitleWidget(game: game),
              ],
            )));
  }
}
