import 'package:flutter/material.dart';
import 'package:giatla_sv/screens/account/account_screen.dart';
import 'package:giatla_sv/screens/bookmark/bookmark_screen.dart';
import 'package:giatla_sv/screens/notification/notification_screen.dart';
import 'package:giatla_sv/screens/setting_screen/setting_screen.dart';
import 'package:giatla_sv/screens/transaction/transaction_screen.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

class PresistentTabScreen extends StatefulWidget {
  int index;
  PresistentTabScreen({super.key, required this.index});

  @override
  State<PresistentTabScreen> createState() => _PresistentTabScreenState();
}

class _PresistentTabScreenState extends State<PresistentTabScreen> {
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.index);
  }

  List<Widget> _buildScreens() {
    return [
      const AccountScreen(),
      const TransactionScreen(),
      const BookMarkScreen(),
      const NotificationScreen(),
      const SettingScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person),
        title: "Tài khoản",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.share),
        title: "Giao dịch",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.bookmark),
        title: "Đã lưu",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.notifications),
        title: "Thông báo",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.settings),
        title: "Cài đặt",
        activeColorPrimary: Colors.black,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 3,
                offset: Offset(0, 3)),
          ]),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}
