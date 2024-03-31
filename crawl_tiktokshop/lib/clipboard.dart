import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ClipboardService {
  static const platform = MethodChannel('clipboard_service');
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> startService() async {
    try {
      await platform.invokeMethod('startService');
    } on PlatformException catch (e) {
      print("Failed to start service: '${e.message}'.");
    }
  }

  static String init() {
    platform.setMethodCallHandler((call) async {
      if (call.method == "onClipboardChange") {
        String clipboardText = call.arguments;
        print('Clipboard content changed: $clipboardText');
        // Handle clipboard data here
        return clipboardText;
      }
    });
    return "";
  }
}
