import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lib_components/responsive/desktop_scaffold.dart';
import 'package:lib_components/responsive/mobile_scaffold.dart';
import 'package:lib_components/responsive/responsive_layout.dart';
import 'package:lib_components/responsive/tablet_scaffold.dart';
import 'package:lib_components/routes.dart';
import 'package:lib_components/themes/theme_provider.dart';
import 'package:provider/provider.dart';

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
          theme: Provider.of<ThemeProvider>(context).themeData,
          routes: routes,
          home: child,
        );
      },
      child: const ResponsiveLayout(
        mobileScaffold: MobileScaffold(),
        tabletScaffold: TabletScaffold(),
        desktopScaffold: DesktopScaffold(),
      ),
    );
  }
}
