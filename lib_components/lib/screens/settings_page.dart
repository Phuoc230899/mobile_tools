import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lib_components/themes/theme_provider.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("S E T T I N G S"),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // dark mode
                  const Text(
                    "Dark Mode",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  //switch
                  CupertinoSwitch(
                      value: Provider.of<ThemeProvider>(context, listen: false)
                          .isDarkMode,
                      onChanged: (value) =>
                          Provider.of<ThemeProvider>(context, listen: false)
                              .toggleTheme())
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // dark mode
                  const Text(
                    "Dark Mode",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  //switch
                  ToggleSwitch(
                    minWidth: 50.0,
                    minHeight: 30.0,
                    initialLabelIndex:
                        Provider.of<ThemeProvider>(context, listen: false)
                                .isDarkMode
                            ? 1
                            : 0,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    icons: const [
                      FontAwesomeIcons.lightbulb,
                      FontAwesomeIcons.solidLightbulb,
                    ],
                    iconSize: 30.0,
                    activeBgColors: const [
                      [Colors.yellow, Colors.orange],
                      [Colors.black45, Colors.black26],
                    ],
                    animate: true,
                    // curve: Curves.easeIn,
                    onToggle: (index) {
                      print('switched to: $index');
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme2(index);
                    },
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // dark mode
                  const Text(
                    "Dark Mode",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  //switch
                  LiteRollingSwitch(
                    //initial value
                    value: isDarkMode,
                    textOn: 'On',
                    width: 100,
                    textOff: 'Off',
                    colorOn: Colors.black26,
                    colorOff: Colors.yellow,
                    iconOn: FontAwesomeIcons.lightbulb,
                    iconOff: FontAwesomeIcons.solidLightbulb,
                    textSize: 16.0,
                    onChanged: (bool state) {},
                    onTap: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    onDoubleTap: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                    onSwipe: () {
                      Provider.of<ThemeProvider>(context, listen: false)
                          .toggleTheme();
                    },
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
