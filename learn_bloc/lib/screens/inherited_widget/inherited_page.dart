import 'package:flutter/material.dart';
import 'package:learn_bloc/util/parent.dart';

class Parent extends StatefulWidget {
  const Parent({super.key});

  @override
  State<Parent> createState() => _ParentState();
}

class _ParentState extends State<Parent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FamilyProvider(colorHair: "black", child: const ChildWidget()),
    );
  }
}

class ChildWidget extends StatelessWidget {
  const ChildWidget({super.key});
  @override
  Widget build(BuildContext context) {
    final familyProvider =
        context.dependOnInheritedWidgetOfExactType<FamilyProvider>();
    String colorHair = familyProvider!.colorHair;
    return Center(child: Text(colorHair),);
  }
}
