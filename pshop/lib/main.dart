import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pshop/themes/theme_provider.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}
