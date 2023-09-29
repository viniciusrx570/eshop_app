import 'package:eshop_app/src/core/theme/theme.dart';
import 'package:eshop_app/src/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: context.watch<ThemeProvider>().themeData,
      home: const HomeScreen(),
    );
  }
}
