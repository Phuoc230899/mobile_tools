import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giatla_sv/components/persistent_nav.dart';
import 'package:giatla_sv/screens/account/account_screen.dart';
import 'package:giatla_sv/screens/home/homepage.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> opacity;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    opacity = Tween<double>(begin: 1.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward().then((_) {
      navigationPage();
    });
  }

  void navigationPage() {
    Navigator.push(
        context,
        PageTransition(
            type: PageTransitionType.scale,
            alignment: Alignment.bottomCenter,
            child: const HomePageScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
          child: Opacity(
              opacity: opacity.value,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(TextSpan(
                        text: "Giặt Là",
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 30.h),
                        children: [
                          TextSpan(
                              text: " SV",
                              style: TextStyle(
                                  fontFamily: "Oleo Script",
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 30.h))
                        ])),
                    Lottie.asset('assets/animations/washing_machine.json')
                  ]))),
    );
  }
}
