import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/screens/base_view.dart';
import '../../../../core/ui/widgets/custom_scaffold.dart';
import '../../view_model/app_main_view_model.dart';
import 'app_main_content_view.dart';

class AppMainViewParam {}

class AppMainView extends BaseView<AppMainViewParam> {
  const AppMainView({super.key, required super.param});

  static const String routeName = "/AppMainView";

  @override
  State<AppMainView> createState() => _AppMainViewState();
}

class _AppMainViewState extends State<AppMainView> {
  late AppMainViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = AppMainViewModel(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: const CustomScaffold(
        body: AppMainContentView(),
      ),
      builder: (context, child) {
        context.select<AppMainViewModel, bool>((p) => p.isLoading);
        return ModalProgressHUD(inAsyncCall: vm.isLoading, child: child!);
      },
    );
  }

  @override
  void dispose() {
    vm.closeModel();
    super.dispose();
  }
}
