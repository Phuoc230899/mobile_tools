import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pshop/constant.dart';
import 'package:pshop/utils/my_bottombar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final NavigationController getController = Get.put(NavigationController());
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      bottomNavigationBar: MyBottomBar(getController: getController),
      body: Obx(() => getController.screens[getController.selectedIndex.value]),
    );
  }
}
