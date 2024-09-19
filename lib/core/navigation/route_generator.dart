import 'package:flutter/material.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../../features/home/view/folder_file/folder_file_view.dart';
import '../../features/home/view/home/home_view.dart';
import '../common/app_config.dart';
import '../constants/enum/route_type.dart';
import '../ui/screens/base_view.dart';
import 'animations/animated_route.dart';
import 'animations/fade_route.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  // Getting arguments passed in while calling Navigator.pushNamed
  // final args = settings.arguments;

  switch (settings.name) {
    case HomeView.routeName:
      return _getRoute<HomeViewParam>(
        settings: settings,
        createScreen: (param) => HomeView(param: param),
      );
    case FolderFileView.routeName:
      return _getRoute<FolderFileViewParam>(
        settings: settings,
        createScreen: (param) => FolderFileView(param: param),
      );
    default:
      // If there is no such named route in the switch statement, e.g. /third
      return _errorRoute();
  }
}

Route _getRoute<ParamType>({
  required RouteSettings settings,
  required BaseView Function(
    ParamType param,
  ) createScreen,
  RouteType type = RouteType.FADE,
}) {
  try {
    final args = settings.arguments;
    if (args != null && args is ParamType) {
      switch (type) {
        case RouteType.FADE:
          return FadeRoute(
            page: createScreen(
              args as ParamType,
            ),
            settings: settings,
          );
        case RouteType.ANIMATED:
          return AnimatedRoute(
            page: createScreen(
              args as ParamType,
            ),
            settings: settings,
          );
        case RouteType.SWIPABLE:
          return SwipeablePageRoute(
            canOnlySwipeFromEdge: true,
            builder: (context) {
              return createScreen(args as ParamType);
            },
            settings: settings,
          );
      }
    }
  } catch (e) {
    return _errorRoute();
  }

  return _errorRoute(argumentError: true);
}

Route<dynamic> _errorRoute({bool argumentError = false}) {
  return MaterialPageRoute(
    builder: (_) {
      return Scaffold(
        backgroundColor: Theme.of(AppConfig.appNavigatorKey.currentContext!)
            .scaffoldBackgroundColor,
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Text(
            argumentError
                ? 'ROUTE ERROR CHECK ARGUMENT THAT PASSED TO THIS SCREEN.'
                : 'ROUTE ERROR CHECK THE ROUTE GENERATOR.',
            textAlign: TextAlign.center,
          ),
        ),
      );
    },
  );
}
