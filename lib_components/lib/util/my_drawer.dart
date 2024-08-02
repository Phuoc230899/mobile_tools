import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,     
      child: Column(children: [
        const DrawerHeader(child: Icon(Icons.favorite)),
        const ListTile(
          leading: Icon(Icons.home),
          title: Text("D A S H B O A R D"),
        ),
        const ListTile(
          leading: Icon(Icons.chat),
          title: Text("M E S S A G E"),
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text("S E T T I N G S"),
          onTap: () => Navigator.pushNamed(context, "/settings"),
        ),
        const ListTile(
          leading: Icon(Icons.logout),
          title: Text("L O G O U T"),
        )
      ]),
    );
  }
}
