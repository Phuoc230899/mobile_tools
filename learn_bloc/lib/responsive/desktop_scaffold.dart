import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:learn_bloc/constants.dart';

class DesktopScaffold extends StatefulWidget {
  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<DesktopScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar,
      backgroundColor: myDefaultBackground,
      body: Row(children: [
        // open drawer
        myDrawer,

        // rest of body
      ]),
    );
  }
}
