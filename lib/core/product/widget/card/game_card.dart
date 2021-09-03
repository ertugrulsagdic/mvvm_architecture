import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';

import '../../../../view/home/game/model/game_model.dart';

class GameCard extends StatelessWidget {
  final GameModel? model;
  final VoidCallback? onPressed;

  const GameCard({Key? key, this.model, this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(
                model!.image!,
                height: context.dynamicHeight(0.25),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  model!.name!,
                  maxLines: 2,
                  minFontSize: 5,
                ),
                Text('\$ ${model!.money}'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
