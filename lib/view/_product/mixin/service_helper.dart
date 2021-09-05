import 'package:logger/logger.dart';

mixin ServiceHelper {
  void showLog(dynamic message) {
    Logger().wtf(message);
  }
}
