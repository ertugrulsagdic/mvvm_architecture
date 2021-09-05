import 'package:flutter/cupertino.dart';

extension WidgetExtension on Widget {
  Widget get toSliver {
    return SliverToBoxAdapter(
      child: this,
    );
  }
}
