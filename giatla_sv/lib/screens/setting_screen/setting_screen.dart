import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(
              Icons.settings_outlined,
              size: 20.h,
              color: Colors.white,
            ),
          )
        ],
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
                      print("hello");
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
                  height: 200.h,
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("App ID",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold)),
                              Text("******",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold)),
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
                              Text("Secret Key",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold)),
                              Text("******",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold)),
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
                              Text("Template ID",
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold)),
                              Text("******",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 15.h,
                                      fontWeight: FontWeight.bold)),
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