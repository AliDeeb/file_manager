import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

import 'custom_theme_colors.dart';

import 'text_theme_styles.dart';

part 'light/light_theme.dart';
part 'dark/dark_theme.dart';

class ThemesData {
  static ThemeData get lightTheme => _getLightTheme();
  static ThemeData get darkTheme => _getDarkTheme();
}
