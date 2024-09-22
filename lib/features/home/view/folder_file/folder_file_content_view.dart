import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/theme/text_theme_styles.dart';
import '../../../../core/ui/dialogs/folder_file_details_dialog.dart';
import '../../view_model/folder_file_view_model.dart';

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
              final name = vm.foldersAndFiles[index].path.split("/").last;
              final isFile = vm.foldersAndFiles[index].statSync().type ==
                  FileSystemEntityType.file;

              return GestureDetector(
                onLongPress: () {
                  showMenu<int>(
                    context: context,
                    position: const RelativeRect.fromLTRB(0, 0, 0, 0),
                    items: [
                      PopupMenuItem(
                        child: const Text("Details"),
                        onTap: () {
                          showFolderFileDetailsDialog(
                            vm.foldersAndFiles[index].statSync(),
                            name,
                          );
                        },
                      ),
                      PopupMenuItem(
                        child: const Text("Delete"),
                        onTap: () {
                          vm.onDeleteTap(index);
                        },
                      ),
                    ],
                  );
                },
                onTap: () => vm.onFolderFileTap(index),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isFile ? Colors.blueGrey : Colors.amber,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          isFile ? Icons.file_copy : Icons.folder_outlined,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        child: Text(
                          name,
                          style: TextThemeStyles.text_14_Regular.copyWith(
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
