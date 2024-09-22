import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/external_storage_handler.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/theme/text_theme_styles.dart';
import '../../view_model/folder_file_view_model.dart';
import 'folder_file_view.dart';

class FolderFileContentView extends StatefulWidget {
  const FolderFileContentView({super.key});

  @override
  State<FolderFileContentView> createState() => _FolderFileContentViewState();
}

class _FolderFileContentViewState extends State<FolderFileContentView> {
  late FolderFileViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<FolderFileViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FolderFileViewModel>();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Path: ${vm.param.path}",
            style: TextThemeStyles.text_12_Regular.copyWith(
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            itemCount: vm.foldersAndFiles.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () => vm.onDeleteFolderTap(index),
                onTap: () {
                  if (ExternalStorageHandler.canOpenDirectory(
                      vm.foldersAndFiles[index].path)) {
                    Nav.to(
                      FolderFileView.routeName,
                      arguments: FolderFileViewParam(
                        path: vm.foldersAndFiles[index].path,
                      ),
                    );
                  }
                },
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    vm.foldersAndFiles[index].path.split("/").last,
                    style: TextThemeStyles.text_14_Regular.copyWith(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
