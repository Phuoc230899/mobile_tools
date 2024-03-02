import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NavBarWidget extends StatelessWidget {
  NavBarWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.only(
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
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.share),
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.bookmark),
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.notifications),
                    onPressed: () {},
                    color: Colors.black,
                    iconSize: 25.h,
                  ),
                  IconButton(
                    icon: const Icon(Icons.settings),
                    onPressed: () {},
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
