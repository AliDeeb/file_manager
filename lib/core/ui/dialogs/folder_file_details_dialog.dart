import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_config.dart';
import '../../theme/text_theme_styles.dart';

void showFolderFileDetailsDialog(FileStat file, String name) {
  showDialog(
    context: AppConfig.appNavigatorKey.currentContext!,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Details:",
                style: TextThemeStyles.text_26_Semibold.copyWith(
                  color: Colors.black,
                ),
              ),
              10.verticalSpace,
              Text(
                "Name: $name",
                style: TextThemeStyles.text_14_Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              5.verticalSpace,
              Text(
                "Size: ${file.size}",
                style: TextThemeStyles.text_14_Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              5.verticalSpace,
              Text(
                "Last modified: ${file.modified}",
                style: TextThemeStyles.text_14_Regular.copyWith(
                  color: Colors.black,
                ),
              ),
              5.verticalSpace,
              Text(
                "File type: ${file.type}",
                style: TextThemeStyles.text_14_Regular.copyWith(
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
