import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/common/external_storage_handler.dart';
import '../../../../core/theme/text_theme_styles.dart';
import '../../view_model/home_view_model.dart';

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
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      itemCount: vm.rootFoldersAndFiles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            vm.rootFoldersAndFiles[index].path,
            style: TextThemeStyles.text_14_Regular.copyWith(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
