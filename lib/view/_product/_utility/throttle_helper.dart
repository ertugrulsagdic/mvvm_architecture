import 'dart:async';

class ThrottleHelper {
  String? _passText;

  final int _maxTimerValue = 5;
  int _timerValue = 0;

  ThrottleHelper() {
    _onSetMaxValue();
  }

  void onDelayTouch(String text, Function(String? text) onComplete) {
    _passText = text;
    if (_timerValue == _maxTimerValue) {
      Timer.periodic(Duration(milliseconds: 100), (timer) {
        _timerValue--;
        if (_timerValue == 0) {
          onComplete(_passText);
          timer.cancel();
          _onSetMaxValue();
        }
      });
    } else {
      _onSetMaxNearValue();
    }
  }

  void _onSetMaxValue() {
    _timerValue = _maxTimerValue;
  }

  void _onSetMaxNearValue() {
    _timerValue = _maxTimerValue - 1;
  }
}
