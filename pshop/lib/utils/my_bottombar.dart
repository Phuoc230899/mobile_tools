import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyBottomBar extends StatelessWidget {
  final getController;
  const MyBottomBar({super.key, required this.getController});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => NavigationBar(
        height: 80.h,
        elevation: 0,
        selectedIndex: getController.selectedIndex.value,
        backgroundColor: Colors.transparent,
        onDestinationSelected: (index) =>
            getController.selectedIndex.value = index,
        destinations: const [
          // home screen
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            selectedIcon: Icon(Icons.home),
          ),

          // shope screen
          NavigationDestination(
              icon: Icon(Icons.shopping_cart_outlined),
              label: 'Shop',
              selectedIcon: Icon(Icons.shopping_cart)),

          // bag screen
          NavigationDestination(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Bag',
              selectedIcon: Icon(Icons.shopping_bag)),

          // Favorities screen
          NavigationDestination(
              icon: Icon(Icons.favorite_outline),
              label: 'Favorites',
              selectedIcon: Icon(Icons.favorite)),

          // Settings screen
          NavigationDestination(
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
              selectedIcon: Icon(Icons.settings)),
        ],
      ),
    );
  }
}
