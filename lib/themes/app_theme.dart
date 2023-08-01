import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Application light colorscheme
final kLightLeeshoColorScheme =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 28, 181, 224));

final appTheme = ThemeData(useMaterial3: true).copyWith(
  colorScheme: kLightLeeshoColorScheme,
  appBarTheme: const AppBarTheme()
      .copyWith(foregroundColor: kLightLeeshoColorScheme.primary),
  iconTheme: const IconThemeData().copyWith(color: kLightLeeshoColorScheme.onPrimary),
  textTheme: GoogleFonts.latoTextTheme()
);

final appMainBackgroundGradient = LinearGradient(colors: [
  kLightLeeshoColorScheme.primary,
  kLightLeeshoColorScheme.primary.withOpacity(0.6),
], begin: Alignment.bottomCenter, end: Alignment.topRight);

final allProductScreenSearchBoxDecoration = InputDecoration(
  hintText: "Search product in the catalog",
  border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12))),
  labelStyle: appTheme.textTheme.labelMedium!.copyWith(
      color: appTheme.colorScheme.onPrimaryContainer),
);
