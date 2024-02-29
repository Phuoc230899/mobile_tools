import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:wi_tools/utils/local_notifications.dart';
import 'package:wi_tools/utils/save2gallery.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
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

  Future<bool> saveImage(String url) async {
    bool result = await _save2gallery.saveToGallery(url);
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 120.h,
              backgroundColor: Colors.white,
              flexibleSpace: Stack(children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25))),
                )
              ]),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 100.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Container(
              color: Colors.transparent,
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4 - 20.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40.h,
                          backgroundColor: Colors.transparent,
                          child: const Image(
                              image: AssetImage('assets/images/logo.png')),
                        ),
                        Text(
                          "Wi Tools Download Image",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.h,
                              color: Colors.lightBlue.withOpacity(0.7)),
                        )
                      ]),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 4 - 20.h,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.all(Radius.circular(25)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 3),
                        ),
                      ]),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10.h),
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: TextField(
                            key: const Key('textfield'),
                            controller: urlController,
                            focusNode: _focusNode,
                            autofocus: true,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintText: 'Enter your imgage url',
                              hintStyle: TextStyle(
                                  color: Colors.grey.withOpacity(0.8)),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 2.0,
                                ),
                              ),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent)),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10.w, right: 10.w),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
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
                                        List<String> urls =
                                            inputString.split('|');
                                        try {
                                          setState(() {
                                            loading = true;
                                          });
                                          bool result = true;
                                          await _save2gallery.deleteAllVideos();
                                          await _save2gallery.deleteToGallery();
                                          for (String url in urls) {
                                            result = await saveImage(url);
                                            if (!result) {
                                              setState(() {
                                                loading = false;
                                                messageFail = 'Failed requests';
                                                messageSuccess = "";
                                              });
                                              break;
                                            }
                                          }
                                          if (result) {
                                            setState(() {
                                              loading = false;
                                              messageSuccess =
                                                  'Download Successfully';
                                              messageFail = "";
                                              urlController.clear();
                                            });
                                          }
                                        } catch (e) {
                                          setState(() {
                                            loading = false;
                                            messageFail = 'Failed $e';
                                            messageSuccess = "";
                                          });
                                        }
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    padding: const EdgeInsets.all(25.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                  ),
                                  child: loading
                                      ? const SpinKitRing(
                                          color: Colors.white, size: 30.0)
                                      : const Text(
                                          "Download",
                                          semanticsLabel: 'buttonDownload',
                                        ),
                                ),
                              ]),
                        )
                      ]),
                ),
                SizedBox(
                  height: 100.h,
                ),
                Column(
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
                )
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}
