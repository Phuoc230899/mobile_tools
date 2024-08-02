import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:pshop/routes.dart';
import 'package:pshop/screens/homepage.dart';
import 'package:pshop/themes/theme_provider.dart';

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
      child: const HomeScreen(),
    );
  }
}
