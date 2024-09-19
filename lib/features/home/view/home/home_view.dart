import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/screens/base_view.dart';
import '../../../../core/ui/widgets/custom_scaffold.dart';
import '../../view_model/home_view_model.dart';
import 'home_content_view.dart';

class HomeViewParam {}

class HomeView extends BaseView<HomeViewParam> {
  const HomeView({super.key, required super.param});

  static const String routeName = "/HomeView";

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = HomeViewModel(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: CustomScaffold(
        appBar: AppBar(title: const Text("Home view")),
        body: const HomeContentView(),
      ),
      builder: (context, child) {
        context.select<HomeViewModel, bool>((p) => p.isLoading);
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