import 'package:flutter/cupertino.dart';
import '../../../core/components/decoration/circle_decoration.dart';

class DecorationHelper {
  BuildContext? context;

  DecorationHelper({this.context});

  Decoration circleDecoration(Color color) =>
      CircleDecoration(color: color, radius: 3);
}
