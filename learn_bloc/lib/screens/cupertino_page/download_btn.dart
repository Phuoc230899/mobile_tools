// ignore_for_file: prefer_const_declarations, prefer_const_constructors

import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class BtnDownloadExample extends StatefulWidget {
  const BtnDownloadExample({super.key});

  @override
  State<BtnDownloadExample> createState() => _BtnDownloadExampleState();
}

class _BtnDownloadExampleState extends State<BtnDownloadExample> {
  Future<Uint8List>? _downloadFuture;
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();

  Future<Uint8List> startDownload(urlString) async {
    // Thay thế bằng URL hình ảnh của bạn
    final url = urlString;
    final response = await http.get(Uri.parse(url));
    await Future.delayed(Duration(seconds: 3));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('Tải xuống hình ảnh thất bại');
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Thông báo'),
            content: Text('Không được để rỗng'),
            actions: [
              CupertinoDialogAction(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Trang Tải Xuống'),
        leading: CupertinoNavigationBarBackButton(
          onPressed: () => Navigator.pop(context),
          color: Colors.black,
        ),
      ),
      child: Center(
        child: _downloadFuture == null
            ? SizedBox(
                width: 500,
                height: 200,
                child: Form(
                  key: _formKey,
                  child: ListView(
                    padding: EdgeInsets.all(16.0),
                    children: [
                      CupertinoTextField(
                        controller: _nameController,
                        placeholder: 'url',
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: CupertinoColors.systemGrey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      SizedBox(height: 32.0),
                      CupertinoButton.filled(
                        child: Text('Download'),
                        onPressed: () {
                          if (_nameController.text.isEmpty) {
                            _submitForm();
                          } else {
                            setState(() {
                              _downloadFuture =
                                  startDownload(_nameController.text);
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
              )
            : FutureBuilder<Uint8List>(
                future: _downloadFuture,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CupertinoActivityIndicator(
                        radius: 15.0, color: CupertinoColors.activeBlue);
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Lỗi: ${snapshot.error}'),
                          SizedBox(height: 20),
                          CupertinoButton(
                            color: CupertinoColors.activeBlue,
                            child: Text('Thử Lại'),
                            onPressed: () {
                              setState(() {
                                _downloadFuture = null;
                                _nameController.clear();
                              });
                            },
                          ),
                        ],
                      );
                    } else if (snapshot.hasData) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.memory(snapshot.data!),
                          SizedBox(height: 20),
                          CupertinoButton(
                            color: CupertinoColors.activeBlue,
                            child: Text('Tải Xuống Lại'),
                            onPressed: () {
                              setState(() {
                                _downloadFuture = null;
                                _nameController.clear();
                              });
                            },
                          ),
                        ],
                      );
                    }
                  }
                  return SizedBox(
                    width: 500,
                    height: 200,
                    child: Form(
                      key: _formKey,
                      child: ListView(
                        padding: EdgeInsets.all(16.0),
                        children: [
                          CupertinoTextField(
                            controller: _nameController,
                            placeholder: 'url',
                            padding: EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              border:
                                  Border.all(color: CupertinoColors.systemGrey),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          SizedBox(height: 32.0),
                          CupertinoButton.filled(
                            child: Text('Download'),
                            onPressed: () {
                              if (_nameController.text.isEmpty) {
                                _submitForm();
                              } else {
                                setState(() {
                                  _downloadFuture =
                                      startDownload(_nameController.text);
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
