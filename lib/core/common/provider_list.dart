import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../features/home/view/app_main/app_main_view.dart';
import '../../features/home/view_model/app_main_view_model.dart';

/// Centralizing all app providers in one class to be easy to adjust and read
class ApplicationProvider {
  static final ApplicationProvider _instance = ApplicationProvider._init();

  factory ApplicationProvider() => _instance;

  ApplicationProvider._init();

  List<SingleChildWidget> singleItems = [];

  List<SingleChildWidget> dependItems = [
    /// Change notifier provider

    ChangeNotifierProvider(
      create: (_) => AppMainViewModel(AppMainViewParam()),
      lazy: true,
    ),
  ];

  List<SingleChildWidget> uiChangesItems = [];

  void dispose(BuildContext context) {
    context.read<AppMainViewModel>().closeModel();
  }
}
