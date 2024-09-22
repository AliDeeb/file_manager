import 'dart:io';

import '../../../core/common/external_storage_handler.dart';
import '../../../core/common/view_model/base_view_model.dart';
import '../../../core/navigation/nav.dart';
import '../../../core/ui/dialogs/confirm_dialog.dart';
import '../../../core/ui/dialogs/enter_name_dialog.dart';
import '../view/folder_file/folder_file_view.dart';

class FolderFileViewModel extends BaseViewModel<FolderFileViewParam> {
  FolderFileViewModel(super.param) {
    foldersAndFiles = ExternalStorageHandler.getFoldersAndFiles(param.path);
  }

  List<FileSystemEntity> foldersAndFiles = [];

  // methods
  void refreshFoldersAndFiles() {
    foldersAndFiles = ExternalStorageHandler.getFoldersAndFiles(param.path);
    notifyListeners();
  }

  void onAddFolderTap() async {
    final folderName = await showEnterNameDialog();
    if (folderName != null) {
      final success =
          ExternalStorageHandler.createFolder(param.path, folderName);
      if (success) {
        refreshFoldersAndFiles();
      }
    }
  }

  void onDeleteFolderTap(int index) {
    showConfirmDialog(
      "Are you sure to delete this folder",
      () {
        Nav.pop();
        final success = ExternalStorageHandler.deleteFolder(
          foldersAndFiles[index].path,
        );
        if (success) {
          refreshFoldersAndFiles();
        }
      },
    );
  }

  @override
  void closeModel() {
    dispose();
  }
}
