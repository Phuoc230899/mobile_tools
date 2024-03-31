import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:crawl_tiktokshop/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with ClipboardListener {
  String _clipboardData = '';
  static const platform = MethodChannel('clipboard_service');
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  void _initializeNotifications() {
    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  void _showNotification(String title, String message) async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'clipboard_channel_id', 'Clipboard Channel',
        importance: Importance.defaultImportance,
        priority: Priority.defaultPriority,
        ticker: 'ticker');
    var platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
        0, title, message, platformChannelSpecifics);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    clipboardWatcher.addListener(this);
    // start watch
    clipboardWatcher.start();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    clipboardWatcher.removeListener(this);
    // stop watch
    clipboardWatcher.stop();
  }

  void onClipboardChanged() async {
    ClipboardData? newClipboardData =
        await Clipboard.getData(Clipboard.kTextPlain);
    print(newClipboardData?.text ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('start'),
              onPressed: () {
                // clipboardWatcher.start();
                ClipboardService.startService();
                _showNotification(
                    'Clipboard content changed', ClipboardService.init());
              },
            ),
            ElevatedButton(
              child: const Text('stop'),
              onPressed: () {
                clipboardWatcher.stop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
