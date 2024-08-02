import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_components/util/my_appbar.dart';
import 'package:lib_components/util/my_drawer.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: const Row(children: [
        // open drawer
        MyDrawer(),

        // rest of body
      ]),
    );
  }
}
