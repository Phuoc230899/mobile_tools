import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giatla_sv/components/persistent_nav.dart';
import 'package:giatla_sv/screens/splash/splash_screen.dart';

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
          title: 'Giặt là SV',
          theme: ThemeData(
            primaryColor: Colors.black,
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}
