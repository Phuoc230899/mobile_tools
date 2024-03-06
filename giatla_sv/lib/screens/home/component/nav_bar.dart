import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giatla_sv/components/persistent_nav.dart';
import 'package:giatla_sv/services/local_auth_service.dart';
import 'package:local_auth/local_auth.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late LocalAuthentication auth;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth = LocalAuthentication();
  }

  Future<bool> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: "Check pass",
        options:
            const AuthenticationOptions(stickyAuth: true, biometricOnly: false),
      );
      return authenticated;
    } on PlatformException catch (e) {
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    void navPushScreen(int index) async {
      // bool authenticated = await _authenticate();
      // if (authenticated) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => PresistentTabScreen(index: index)),
        );
      // }
    }

    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      child: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        color: Colors.white,
        elevation: 10,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: 50.0.h,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  // Column(mainAxisSize: MainAxisSize.min, children: [
                  //   IconButton(
                  //     icon: const Icon(Icons.home_outlined),
                  //     onPressed: () {},
                  //     color: Colors.grey,
                  //   ),
                  //   Text("Tài khoản")
                  // ]),
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      navPushScreen(0);
                    },
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {
                      navPushScreen(1);
                    },
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark),
                    onPressed: () {
                      navPushScreen(2);
                    },
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {
                      navPushScreen(3);
                    },
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {
                      navPushScreen(4);
                    },
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
