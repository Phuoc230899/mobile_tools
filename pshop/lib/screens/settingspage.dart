import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pshop/themes/theme_provider.dart';
import 'package:pshop/utils/my_searchtextfield.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "Settings",
            style: TextStyle(
              fontSize: 26.w,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.h),
          MySearchTextField(searchController: _searchController),
          SizedBox(height: 10.h),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        flex: 1,
                        child: Icon(Icons.airplanemode_active_outlined),
                      ),
                      const Expanded(
                        flex: 5,
                        child: Text("Chế độ máy bay"),
                      ),
                      Expanded(
                        flex: 1,
                        child: CupertinoSwitch(
                            value: Provider.of<ThemeProvider>(context,
                                    listen: false)
                                .isDarkMode,
                            onChanged: (value) => Provider.of<ThemeProvider>(
                                    context,
                                    listen: false)
                                .toggleTheme()),
                      )
                    ],
                  ),
                  Divider(
                    color: Colors.grey.shade100,
                  ),
                  Material(
                    color: Colors.transparent,
                    borderOnForeground: false,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => print("Language Page"),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.language),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text("Ngôn ngữ"),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.chevron_right_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade100,
                  ),
                  Material(
                    color: Colors.transparent,
                    borderOnForeground: false,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => print("Language Page"),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.notifications),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text("Cài đặt thông báo"),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.chevron_right_outlined),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.grey.shade100,
                  ),
                  Material(
                    color: Colors.transparent,
                    borderOnForeground: false,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20.0),
                      onTap: () => print("Language Page"),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.help_rounded),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text("Hỗ Trợ"),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(Icons.chevron_right_outlined),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.yellow,
            height: 50.h,
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.blue,
            height: 50.h,
          ),
          SizedBox(height: 10.h),
          Container(
            color: Colors.green,
            height: 50.h,
          )
        ]),
      )),
    );
  }
}
