import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:pshop/screens/settingspage.dart';

class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    Container(color: Colors.red),
    Container(color: Colors.yellow),
    Container(color: Colors.green),
    Container(color: Colors.blue),
    const SettingScreen()
  ];
}
