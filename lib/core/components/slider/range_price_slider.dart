import 'package:flutter/material.dart';

class RangePriceSlider extends StatefulWidget {
  final double min;
  final double max;

  final void Function(RangeValues values) onCompleted;

  const RangePriceSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.onCompleted,
  }) : super(key: key);

  @override
  _RangePriceSliderState createState() => _RangePriceSliderState();
}

class _RangePriceSliderState extends State<RangePriceSlider> {
  late RangeValues _values;

  @override
  void initState() {
    super.initState();
    _values = RangeValues(widget.min, widget.max);
  }

  @override
  Widget build(BuildContext context) {
    return RangeSlider(
      onChanged: (RangeValues value) {
        setState(() {
          _values = value;
        });
        widget.onCompleted(_values);
      },
      values: _values,
      min: widget.min,
      max: widget.max,
      labels: RangeLabels('${_values.start}', '${_values.end}'),
      divisions: 20,
    );
  }
}
