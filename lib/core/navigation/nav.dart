import 'package:flutter/material.dart';

import '../common/app_config.dart';

/// Class to make navigation calling shorter and faster to use
class Nav {
  /// Push
  static Future<T?> to<T extends Object?>(
    String routeName, {
    required Object arguments,
    BuildContext? context,
  }) {
    return Navigator.pushNamed(
      context ?? AppConfig.appNavigatorKey.currentContext!,
      routeName,
      arguments: arguments,
    );
  }

  /// Push replacement
  static Future<T?> off<T extends Object?, TO extends Object?>(
    String routeName, {
    required Object arguments,
    BuildContext? context,
    TO? result,
  }) {
    return Navigator.pushReplacementNamed(
      context ?? AppConfig.appNavigatorKey.currentContext!,
      routeName,
      result: result,
      arguments: arguments,
    );
  }

  /// Pop
  static void pop<T extends Object?>([BuildContext? context, T? result]) {
    if (Navigator.canPop(
        context ?? AppConfig.appNavigatorKey.currentContext!)) {
      Navigator.pop(
          context ?? AppConfig.appNavigatorKey.currentContext!, result);
    } else {
      throw Exception("Can't go back to the previous screen");
    }
  }

  /// Pop until
  static void popTo(bool Function(Route<dynamic>) predicate,
      {BuildContext? context}) {
    Navigator.popUntil(
        context ?? AppConfig.appNavigatorKey.currentContext!, predicate);
  }
}
