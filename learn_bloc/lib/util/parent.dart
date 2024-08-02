import 'package:flutter/material.dart';

class FamilyProvider extends InheritedWidget {
  final String colorHair;
  FamilyProvider({required super.child, required this.colorHair});

  @override
  bool updateShouldNotify(covariant FamilyProvider oldWidget) {
    return colorHair == oldWidget.colorHair;
  }
}
