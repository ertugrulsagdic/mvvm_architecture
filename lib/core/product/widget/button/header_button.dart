import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:kartal/src/context_extension.dart';

import '../../../init/lang/locale_keys.g.dart';

class HeaderButton extends StatelessWidget {
  final String? titleText;
  final VoidCallback? onPressed;

  const HeaderButton({Key? key, this.titleText, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildTitleText(context),
          buildButtonRight(context),
        ],
      ),
    );
  }

  Text buildTitleText(BuildContext context) {
    return Text(
      titleText!,
      style: context.textTheme.headline6!.copyWith(
        color: context.colorScheme.onError,
      ),
    );
  }

  TextButton buildButtonRight(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.zero),
      ),
      onPressed: onPressed,
      child: Wrap(
        children: [
          Text(
            LocaleKeys.home_game_viewAll.tr(),
            style: context.textTheme.headline6!.copyWith(
              color: context.colorScheme.onError,
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: context.colorScheme.onError,
            size: context.mediumValue,
          )
        ],
      ),
    );
  }
}
