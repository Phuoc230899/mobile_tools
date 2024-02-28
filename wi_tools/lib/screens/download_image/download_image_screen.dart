import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wi_tools/utils/save2gallery.dart';

class DownloadImageScreen extends StatefulWidget {
  const DownloadImageScreen({super.key});

  @override
  State<DownloadImageScreen> createState() => _DownloadImageScreenState();
}

class _DownloadImageScreenState extends State<DownloadImageScreen> {
  bool loading = false;
  String errMessage = '';
  late String messageSuccess;
  late String messageFail;
  late FocusNode _focusNode;
  TextEditingController urlController = TextEditingController();
  late PermissionStatus _status;
  late Save2Gallery _save2gallery;

  Future<void> _checkPermission() async {
    PermissionStatus status = await Permission.storage.status;
    setState(() {
      _status = status;
    });
  }

  Future<void> _requestPermission() async {
    PermissionStatus status = await Permission.storage.request();
    setState(() {
      _status = status;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _save2gallery = Save2Gallery();
    _checkPermission();
    FlutterDownloader.initialize();
    _focusNode = FocusNode();
    messageFail = "";
    messageSuccess = "";
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
    urlController.dispose();
  }

  Future<void> saveImage(String url) async {
    try {
      setState(() {
        loading = true;
      });
      bool result = await _save2gallery.saveToGallery(url);
      if (result) {
        setState(() {
          loading = false;
          messageSuccess = 'Download Successfully';
          messageFail = "";
          urlController.clear();
        });
      } else {
        setState(() {
          loading = false;
          messageFail = 'Failed requests';
          messageSuccess = "";
        });
      }
    } catch (e) {
      setState(() {
        loading = false;
        messageFail = 'Failed $e';
        messageSuccess = "";
      });
      print('Error saving image to gallery: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Wi Tools',
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.deepPurple.shade100,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
              onTap: () {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  FocusScope.of(context).requestFocus(_focusNode);
                });
              },
              child: const Text(
                'Nhấn Vào đây !',
                semanticsLabel: 'textbox',
                style: TextStyle(color: Colors.white),
              )),
          TextField(
            key: const Key('textfield'),
            controller: urlController,
            focusNode: _focusNode,
            autofocus: true,
            maxLines: 1,
            decoration: const InputDecoration(
                labelText: 'Enter your imgage url',
                border: OutlineInputBorder(),
                labelStyle: TextStyle(color: Colors.deepPurple)),
          ),
          ElevatedButton(
            key: const Key('btnSend'),
            onPressed: () async {
              messageFail = "";
              messageSuccess = "";
              String inputString = urlController.text;
              if (_status.isDenied) {
                await _requestPermission();
              } else {
                if (inputString.isNotEmpty) {
                  List<String> urls = inputString.split('|');
                  for (String url in urls) {
                    saveImage(url);
                  }
                }
              }
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(50.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: loading
                ? const SpinKitRing(color: Colors.white, size: 30.0)
                : const Text(
                    "Download",
                    semanticsLabel: 'buttonDownload',
                  ),
          ),
          messageFail != ""
              ? Text(
                  key: const Key('message'),
                  messageFail,
                  semanticsLabel: 'messageFail',
                  style: const TextStyle(color: Colors.red),
                )
              : const SizedBox(),
          messageSuccess != ""
              ? Text(
                  key: const Key('message'),
                  messageSuccess,
                  semanticsLabel: 'messageSuccess',
                  style: const TextStyle(color: Colors.green),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
