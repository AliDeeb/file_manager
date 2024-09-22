import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart' as ftoast;
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast {
  static void show(
    String msg, {
    int duration = 2000,
    ftoast.Toast androidDuration = ftoast.Toast.LENGTH_LONG,
    double fontSize = 12,
    ftoast.ToastGravity gravity = ftoast.ToastGravity.BOTTOM,
    Color? backgroundColor,
    Color? textColor,
  }) {
    showToast(
      msg,
      toastLength: androidDuration,
      gravity: gravity,
      timeInSecForIosWeb: duration,
      fontSize: fontSize,
      bg: backgroundColor,
      textColor: textColor,
    );
  }

  factory CustomToast() {
    return _instance;
  }
  CustomToast._internal();
  static final CustomToast _instance = CustomToast._internal();

  final FToast _fToast = ftoast.FToast();

  Future<void> showCustomToast({
    required Widget toast,
    ToastGravity? gravity,
    Duration toastDuration = const Duration(seconds: 3),
    required BuildContext context,
  }) async {
    _fToast.init(context);
    _fToast.removeCustomToast();
    _fToast.showToast(
      gravity: gravity ?? ToastGravity.BOTTOM,
      toastDuration: toastDuration,
      child: toast,
    );
  }

  void cancelCustomToast() {
    _fToast.removeCustomToast();
  }
}

void showToast(
  String msg, {
  double? fontSize,
  ToastGravity? gravity,
  Color? bg,
  Color? textColor,
  ftoast.Toast? toastLength,
  int timeInSecForIosWeb = 1,
}) async {
  // Cancel prev toast
  await ftoast.Fluttertoast.cancel();

  // Show toast
  ftoast.Fluttertoast.showToast(
    msg: msg,
    fontSize: fontSize,
    gravity: gravity,
    backgroundColor: bg,
    textColor: textColor,
    timeInSecForIosWeb: timeInSecForIosWeb,
    toastLength: toastLength,
  );
}
