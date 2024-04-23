import 'package:clipboard_watcher/clipboard_watcher.dart';
import 'package:crawl_tiktokshop/clipboard.dart';
import 'package:crawl_tiktokshop/local_notification.dart';
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
                LocalNotifications.showSimpleNotification(
                    title: "Notifications",
                    body: ClipboardService.init(),
                    payload: "simple data");
              },
            ),
            ElevatedButton(
              child: const Text('stop'),
              onPressed: () {
                clipboardWatcher.stop();
              },
            ),

            ElevatedButton(
              child: const Text('Noti'),
              onPressed: () {
                LocalNotifications.showSimpleNotification(
                    title: "Notifications",
                    body: "test",
                    payload: "simple data");
              },
            ),
          ],
        ),
      ),
    );
  }
}
