import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/app_colors.dart';

/// Centralized the text styles that are used widely in app
class TextThemeStyles {
  static get _headlinesFont => GoogleFonts.poppins().fontFamily;

  static get _font => GoogleFonts.poppins().fontFamily;

  static get displayLarge => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 80.sp,
      fontFamily: _headlinesFont);
  static get displayMedium => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 72.sp,
      fontFamily: _headlinesFont);
  static get displaySmall => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 54.sp,
      fontFamily: _headlinesFont);

  static get headlineLarge => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 46.sp,
      fontFamily: _headlinesFont);
  static get headlineMedium => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 40.sp,
      fontFamily: _headlinesFont);
  static get headlineSmall => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 34.sp,
      fontFamily: _headlinesFont);

  static get titleLarge => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 28.sp,
      fontFamily: _headlinesFont);
  static get titleMedium => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 20.sp,
      fontFamily: _font);
  static get titleSmall => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 16.sp,
      fontFamily: _font);

  static get bodyLarge => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 22.sp,
      fontFamily: _font);
  static get bodyMedium => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 16.sp,
      fontFamily: _font);
  static get bodySmall => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 14.sp,
      fontFamily: _font);

  static get labelLarge => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 14.sp,
      fontFamily: _font);
  static get labelMedium => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 12.sp,
      fontFamily: _font);
  static get labelSmall => TextStyle(
      color: AppColors.defaultTitleTextColor,
      fontSize: 10.sp,
      fontFamily: _font);

  // E-commerce text styles.
  static TextStyle get text_10_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 10.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_10_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 10.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_10_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 10.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_12_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 12.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_12_Medium => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 12.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get text_12_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 12.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_12_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 12.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_14_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 14.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_14_Medium => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 14.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get text_14_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 14.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_14_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 14.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_16_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 16.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_16_Medium => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 16.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get text_16_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 16.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_16_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 16.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_18_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 18.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_18_Medium => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 18.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w500,
      );
  static TextStyle get text_18_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 18.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_18_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 18.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_20_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 20.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_20_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 20.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_20_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 20.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_22_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 22.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_22_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 22.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_22_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 22.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get text_24_Medium => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 24.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get text_24_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 24.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_26_Regular => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 26.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w400,
      );
  static TextStyle get text_26_Semibold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 26.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w600,
      );
  static TextStyle get text_26_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 26.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get text_32_Medium => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 32.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get text_32_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 32.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );
  static TextStyle get text_44_Bold => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 44.sp,
        fontFamily: _font,
        fontWeight: FontWeight.w700,
      );

  static TextStyle get button_Xlarge => TextStyle(
        // color: AppColors.defaultButtonTextColor,
        fontSize: 26.sp,
        fontWeight: FontWeight.w500,
        fontFamily: _headlinesFont,
      );
  static TextStyle get button_Large => TextStyle(
        color: AppColors.defaultButtonTextColor,
        fontSize: 22.sp,
        fontWeight: FontWeight.w500,
        fontFamily: _headlinesFont,
      );
  static TextStyle get button_Medium => TextStyle(
        color: AppColors.defaultButtonTextColor,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
        fontFamily: _headlinesFont,
      );
  static TextStyle get button_Small => TextStyle(
        color: AppColors.defaultButtonTextColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        fontFamily: _headlinesFont,
      );
  static TextStyle get button_Xsmall => TextStyle(
        color: AppColors.defaultButtonTextColor,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
        fontFamily: _headlinesFont,
      );
  static TextStyle get headline_07 => TextStyle(
        color: AppColors.defaultTextColor,
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        fontFamily: _headlinesFont,
      );
}
