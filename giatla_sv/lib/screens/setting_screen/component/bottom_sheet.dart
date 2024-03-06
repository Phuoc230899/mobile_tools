import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBottomSheet extends StatefulWidget {
  final String appId;
  final String secretKey;
  final String templateId;
  final String refreshToken;
  final Function() onClose;

  const MyBottomSheet(
      {super.key,
      required this.appId,
      required this.secretKey,
      required this.templateId,
      required this.onClose,
      required this.refreshToken});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet> {
  late TextEditingController appIdController;
  late TextEditingController secretKeyController;
  late TextEditingController templateIdController;
  late TextEditingController refreshTokenController;

  Future<void> setInfo(appId, secretkey, templateId, refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('appId', appId);
    await prefs.setString('secretKey', secretkey);
    await prefs.setString('templateId', templateId);
    await prefs.setString('refreshTokenZNS', refreshToken);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    appIdController = TextEditingController(text: widget.appId);
    secretKeyController = TextEditingController(text: widget.secretKey);
    templateIdController = TextEditingController(text: widget.templateId);
    refreshTokenController = TextEditingController(text: widget.refreshToken);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w, right: 10.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text("App ID",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.h,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5.h,
          ),
          Container(
            child: TextField(
              controller: appIdController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Nhập App ID',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text("Secret Key",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.h,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5.h,
          ),
          Container(
            child: TextField(
              controller: secretKeyController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Nhập Secret Key',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text("Template ID",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.h,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5.h,
          ),
          Container(
            child: TextField(
              controller: templateIdController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Nhập Template ID',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text("Refresh Token",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.h,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 5.h,
          ),
          Container(
            child: TextField(
              controller: refreshTokenController,
              maxLines: 1,
              decoration: InputDecoration(
                hintText: 'Nhập Refresh Token Zalo',
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.8)),
                enabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  ),
                ),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    borderSide: BorderSide(color: Colors.black)),
              ),
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 40.h),
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await setInfo(appIdController.text, secretKeyController.text,
                    templateIdController.text, refreshTokenController.text);
                widget.onClose();
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.save,
                color: Colors.white,
              ),
              label: Text("Lưu",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.h,
                      fontWeight: FontWeight.w600)),
            ),
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
