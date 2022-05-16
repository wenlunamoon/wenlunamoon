import 'package:flutter/foundation.dart';
import 'package:logging/logging.dart';

final logger = Logger('App');

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((event) {
    String emoji = '';
    if (event.level == Level.INFO) {
      emoji = 'ℹ️';
    } else if (event.level == Level.WARNING) {
      emoji = '⚠️';
    } else if (event.level == Level.SEVERE) {
      emoji = '⛔️';
    }
    debugPrint('$emoji ${event.level}: ${event.message}');
    if (event.error != null) {
      debugPrint('👉 ${event.error}');
    }
    if (event.level == Level.SEVERE) {
      debugPrintStack(stackTrace: event.stackTrace);
    }
  });
}
