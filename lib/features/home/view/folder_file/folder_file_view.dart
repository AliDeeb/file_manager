import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/ui/screens/base_view.dart';
import '../../../../core/ui/widgets/custom_scaffold.dart';
import '../../view_model/folder_file_view_model.dart';
import 'folder_file_content_view.dart';

class FolderFileViewParam {
  final String path;

  FolderFileViewParam({required this.path});
}

class FolderFileView extends BaseView<FolderFileViewParam> {
  const FolderFileView({super.key, required super.param});

  static const String routeName = "/FolderFileView";

  @override
  State<FolderFileView> createState() => _FolderFileViewState();
}

class _FolderFileViewState extends State<FolderFileView> {
  late FolderFileViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = FolderFileViewModel(widget.param);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: vm,
      child: CustomScaffold(
        appBar: AppBar(),
        body: const FolderFileContentView(),
      ),
      builder: (context, child) {
        context.select<FolderFileViewModel, bool>((p) => p.isLoading);
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
