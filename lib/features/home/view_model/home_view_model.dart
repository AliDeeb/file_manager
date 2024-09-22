import 'dart:io';

import 'package:flutter/material.dart';

import '../../../core/common/external_storage_handler.dart';
import '../../../core/common/view_model/base_view_model.dart';
import '../../../core/navigation/nav.dart';
import '../../../core/ui/dialogs/confirm_dialog.dart';
import '../../../core/ui/dialogs/enter_name_dialog.dart';
import '../view/home/home_view.dart';

class HomeViewModel extends BaseViewModel<HomeViewParam> {
  HomeViewModel(super.param);
  List<FileSystemEntity> rootFoldersAndFiles = [];
  GlobalKey _scaffoldKey = GlobalKey();

  GlobalKey get scaffoldKey => _scaffoldKey;

  // methods
  void refreshHome() {
    _scaffoldKey = GlobalKey();
    notifyListeners();
  }

  void onAddFolderTap() async {
    final folderName = await showEnterNameDialog();
    if (folderName != null) {
      final success = ExternalStorageHandler.createFolder(
        ExternalStorageHandler.rootPath!,
        folderName,
      );
      if (success) {
        refreshHome();
      }
    }
  }

  void onDeleteFolderTap(int index) {
    showConfirmDialog(
      "Are you sure to delete this folder",
      () {
        Nav.pop();
        final success = ExternalStorageHandler.deleteFolder(
          rootFoldersAndFiles[index].path,
        );
        if (success) {
          refreshHome();
        }
      },
    );
  }

  @override
  void closeModel() {
    dispose();
  }
}
