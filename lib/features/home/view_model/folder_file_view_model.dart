import 'dart:io';

import '../../../core/common/external_storage_handler.dart';
import '../../../core/common/view_model/base_view_model.dart';
import '../../../core/constants/enum/filter_types.dart';
import '../../../core/constants/enum/sort_types.dart';
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

  void onSortSelected(SortTypes value) {
    switch (value) {
      case SortTypes.nameAToZ:
        foldersAndFiles.sort((a, b) {
          return (a.path.split("/").last).compareTo((b.path.split("/").last));
        });
        notifyListeners();
        break;
      case SortTypes.nameZToA:
        foldersAndFiles.sort((a, b) {
          return (b.path.split("/").last).compareTo((a.path.split("/").last));
        });
        notifyListeners();
        break;
      case SortTypes.sizeSToL:
        foldersAndFiles.sort((a, b) {
          return (a.statSync().size).compareTo((b.statSync().size));
        });
        notifyListeners();
        break;
      case SortTypes.sizeLToS:
        foldersAndFiles.sort((a, b) {
          return (b.statSync().size).compareTo((a.statSync().size));
        });
        notifyListeners();
        break;
      case SortTypes.dateModifiedNewToOld:
        foldersAndFiles.sort((a, b) {
          return (b.statSync().modified).compareTo((a.statSync().modified));
        });
        notifyListeners();
        break;
      case SortTypes.dateModifiedOldToNew:
        foldersAndFiles.sort((a, b) {
          return (a.statSync().modified).compareTo((b.statSync().modified));
        });
        notifyListeners();
        break;
    }
  }

  void onFilterSelected(FilterTypes value) {}

  @override
  void closeModel() {
    dispose();
  }
}
