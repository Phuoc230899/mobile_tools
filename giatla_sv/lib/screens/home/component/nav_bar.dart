import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:giatla_sv/components/persistent_nav.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    void navPushScreen(int index) => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => PresistentTabScreen(index: index)),
      );

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
