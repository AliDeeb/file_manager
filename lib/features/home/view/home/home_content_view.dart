import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/external_storage_handler.dart';
import '../../../../core/navigation/nav.dart';
import '../../../../core/theme/text_theme_styles.dart';
import '../../../../core/ui/widgets/custom_scaffold.dart';
import '../../view_model/home_view_model.dart';
import '../folder_file/folder_file_view.dart';

class HomeContentView extends StatefulWidget {
  const HomeContentView({super.key});

  @override
  State<HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<HomeContentView> {
  late HomeViewModel vm;

  @override
  void initState() {
    super.initState();
    vm = context.read<HomeViewModel>();
    vm.rootFoldersAndFiles = ExternalStorageHandler.getRootFoldersAndFiles();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        itemCount: vm.rootFoldersAndFiles.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              if (ExternalStorageHandler.canOpenDirectory(
                  vm.rootFoldersAndFiles[index].path)) {
                Nav.to(
                  FolderFileView.routeName,
                  arguments: FolderFileViewParam(
                    path: vm.rootFoldersAndFiles[index].path,
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
                vm.rootFoldersAndFiles[index].path.split("/").last,
                style: TextThemeStyles.text_14_Regular.copyWith(
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
