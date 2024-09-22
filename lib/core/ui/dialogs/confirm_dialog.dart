import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/app_config.dart';
import '../../navigation/nav.dart';

void showConfirmDialog(
  String title,
  VoidCallback onConfirm,
) {
  showDialog(
    context: AppConfig.appNavigatorKey.currentContext!,
    builder: (context) {
      return Dialog(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 50.h),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(title),
              50.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextButton(onPressed: Nav.pop, child: Text("Cancel")),
                  FilledButton(
                    onPressed: onConfirm,
                    child: const Text("Confirm"),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
