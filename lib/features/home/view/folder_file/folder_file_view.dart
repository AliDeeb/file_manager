import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/enum/filter_types.dart';
import '../../../../core/constants/enum/sort_types.dart';
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
        appBar: AppBar(
          actions: [
            PopupMenuButton<FilterTypes>(
              onSelected: vm.onFilterSelected,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: FilterTypes.images,
                    child: Text("Images"),
                  ),
                  const PopupMenuItem(
                    value: FilterTypes.textFiles,
                    child: Text("Text Files"),
                  ),
                ];
              },
              child: const Icon(Icons.filter_alt_sharp),
            ),
            20.horizontalSpace,
            PopupMenuButton<SortTypes>(
              onSelected: vm.onSortSelected,
              itemBuilder: (context) {
                return [
                  const PopupMenuItem(
                    value: SortTypes.nameAToZ,
                    child: Text("Name(A-Z)"),
                  ),
                  const PopupMenuItem(
                    value: SortTypes.nameZToA,
                    child: Text("Name(Z-A)"),
                  ),
                  const PopupMenuItem(
                    value: SortTypes.sizeSToL,
                    child: Text("Size(Small to Large)"),
                  ),
                  const PopupMenuItem(
                    value: SortTypes.sizeLToS,
                    child: Text("Size(Large to Small)"),
                  ),
                  const PopupMenuItem(
                    value: SortTypes.dateModifiedNewToOld,
                    child: Text("Date modified(New to Old)"),
                  ),
                  const PopupMenuItem(
                    value: SortTypes.dateModifiedOldToNew,
                    child: Text("Date modified(Old to New)"),
                  ),
                ];
              },
              child: const Icon(Icons.sort),
            ),
            20.horizontalSpace,
          ],
        ),
        body: const FolderFileContentView(),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: vm.onAddFileTap,
              child: const Icon(
                Icons.file_copy,
                color: Colors.white,
              ),
            ),
            5.horizontalSpace,
            FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: vm.onAddFolderTap,
              child: const Icon(
                Icons.create_new_folder,
                color: Colors.white,
              ),
            ),
          ],
        ),
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
