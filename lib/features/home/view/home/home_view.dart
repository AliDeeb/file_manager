import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/external_storage_handler.dart';
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
  late Future<String?> future;

  @override
  void initState() {
    super.initState();
    vm = HomeViewModel(widget.param);
    future = ExternalStorageHandler.getRootPath();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      builder: (context, child) {
        context.select<HomeViewModel, bool>((p) => p.isLoading);
        context.select<HomeViewModel, GlobalKey>((p) => p.scaffoldKey);
        return ModalProgressHUD(
          inAsyncCall: vm.isLoading,
          child: CustomScaffold(
            key: vm.scaffoldKey,
            body: FutureBuilder<String?>(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return snapshot.data != null
                      ? const HomeContentView()
                      : const Center(child: Text("permission denied"));
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    vm.closeModel();
    super.dispose();
  }
}
