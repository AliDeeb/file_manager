import 'package:file_manager/features/home/view/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/app_main_view_model.dart';

class AppMainContentView extends StatefulWidget {
  const AppMainContentView({super.key});

  @override
  State<AppMainContentView> createState() => _AppMainContentViewState();
}

class _AppMainContentViewState extends State<AppMainContentView> {
  late AppMainViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<AppMainViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return HomeView(param: HomeViewParam());
  }
}
