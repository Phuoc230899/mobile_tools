import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giatla_sv/core/api/zns.dart';
import 'package:giatla_sv/screens/setting_screen/component/bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String appId = '';
  String secretKey = '';
  String templateId = '';
  String refreshToken = '';

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return Wrap(
          children: [
            MyBottomSheet(
              appId: appId,
              secretKey: secretKey,
              templateId: templateId,
              refreshToken: refreshToken,
              onClose: () {
                setState(() {
                  getInfo();
                });
              },
            )
          ],
        );
      },
    );
  }

  // Future<void> setInfo() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setString('appId', '3610353763242449688');
  //   await prefs.setString('secretKey', '4jLoV8uIHB8BQWzs8S2h');
  //   await prefs.setString('templateId', '315991');
  // }

  Future<void> getInfo() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      appId = prefs.getString('appId')!;
      secretKey = prefs.getString('secretKey')!;
      templateId = prefs.getString('templateId')!;
      refreshToken = prefs.getString('refreshTokenZNS')!;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getInfo();
    // setInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text(
          "Cài Đặt",
          style: TextStyle(fontSize: 15.h, color: Colors.white),
        ),
        // actions: [
        //   Padding(
        //     padding: EdgeInsets.only(right: 16.w),
        //     child: Icon(
        //       Icons.settings_outlined,
        //       size: 20.h,
        //       color: Colors.white,
        //     ),
        //   )
        // ],
      ),
      body: Stack(children: [
        Container(
          color: Colors.black,
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 30.h),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Thông tin cài đặt",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.h,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    highlightColor: Colors.grey,
                    onTap: () {
                      _showBottomSheet(context);
                    },
                    child: Text(
                      "Chỉnh sửa thông tin",
                      style: TextStyle(fontSize: 12.h, color: Colors.blue),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              Card(
                elevation: 8.0,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: SizedBox(
                  height: 250.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text("App ID",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(appId,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text("Secret Key",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(secretKey,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text("Template ID",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(templateId,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            height: 1,
                            color: Colors.grey.withOpacity(0.5),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text("Refresh Token",
                                    style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                              Expanded(
                                flex: 3,
                                child: Text(refreshToken,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.h,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              )
            ]),
          ),
        ),
      ]),
    );
  }
}


// CustomScrollView(slivers: [
//         SliverAppBar(
//           pinned: true,
//           expandedHeight: 50.0.h,
//           backgroundColor: Colors.white,
//           actions: [
//              Padding(
//               padding: EdgeInsets.only(right: 16.w),
//                child: Icon(
//                 Icons.settings_outlined,
//                 color: Colors.black,
//                 size: 25.h,
//                          ),
//              )
//           ],
//           flexibleSpace: FlexibleSpaceBar(
//             title: Text(
//               "Settings",
//               style: TextStyle(color: Colors.black, fontSize: 12.h),
//             ),
//             background: Container(
//               color: Colors.white,
//             ),
//           ),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             Container(
//               height: 1000.0,
//               color: Colors.black,
//             ),
//           ]),
//         ),
//         SliverList(
//           delegate: SliverChildListDelegate([
//             Container(
//               height: 1000.0,
//               color: Colors.red,
//             ),
//           ]),
//         ),
//       ]),