import 'package:cached_network_image/cached_network_image.dart';
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
        padding: context.horizontalPaddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: model!.image!,
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        image: imageProvider, fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model!.name!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                  Text('\$ ${model!.money}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
