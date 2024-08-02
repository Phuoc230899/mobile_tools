import 'package:flutter/material.dart';
import 'package:lib_components/util/my_appbar.dart';
import 'package:lib_components/util/my_drawer.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: const MyDrawer(),
    );
  }
}
