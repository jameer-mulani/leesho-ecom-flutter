import 'package:flutter/material.dart';
import 'package:flutter_ecom_app/screens/leesho_home_screen.dart';
import 'package:flutter_ecom_app/themes/app_theme.dart';

class LeeshoApp extends StatelessWidget {
  const LeeshoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: appTheme,
      home: const LeeshoHomeScreen(),
    );
  }
}
