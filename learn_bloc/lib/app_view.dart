import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_bloc/responsive/desktop_scaffold.dart';
import 'package:learn_bloc/responsive/mobile_scaffold.dart';
import 'package:learn_bloc/responsive/responsive_layout.dart';
import 'package:learn_bloc/responsive/tablet_scaffold.dart';
import 'package:learn_bloc/screens/counter/counter_screen.dart';
import 'package:learn_bloc/screens/cupertino_page/cupertino_action_sheet.dart';
import 'package:learn_bloc/screens/inherited_widget/inherited_page.dart';
import 'package:learn_bloc/screens/learn_page/responsive_page.dart';
import 'package:learn_bloc/screens/login/login_screen.dart';
import 'package:learn_bloc/screens/remote/remote2_screen.dart';
import 'package:learn_bloc/screens/remote/remote_screen.dart';

class MyAppView extends StatefulWidget {
  const MyAppView({super.key});

  @override
  State<MyAppView> createState() => _MyAppViewState();
}

class _MyAppViewState extends State<MyAppView> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Learn Flutter',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          builder: EasyLoading.init(),
          home: child,
        );
      },
      // child: const ResponsiveLayout(
      //   mobileScaffold: MobileScaffold(),
      //   tabletScaffold: TabletScaffold(),
      //   desktopScaffold: DesktopScaffold(),
      // ),
      child: const Remote2Screen(),
    );
  }
}
