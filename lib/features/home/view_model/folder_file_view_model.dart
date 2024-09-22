import 'dart:io';

import 'package:flutter/material.dart';

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
    foldersAndFilesCopy = [...foldersAndFiles];
  }

  final searchFocusNode = FocusNode();
  List<FileSystemEntity> foldersAndFiles = [];
  List<FileSystemEntity> foldersAndFilesCopy = [];
  FilterTypes? _selectedFilter;

  FilterTypes? get selectedFilter => _selectedFilter;

  // methods
  void refreshFoldersAndFiles() {
    foldersAndFiles = ExternalStorageHandler.getFoldersAndFiles(param.path);
    notifyListeners();
  }

  void onFolderFileTap(index) async {
    bool isDirectory = foldersAndFiles[index].statSync().type ==
        FileSystemEntityType.directory;

    if (isDirectory) {
      Nav.to(
        FolderFileView.routeName,
        arguments: FolderFileViewParam(
          path: foldersAndFiles[index].path,
        ),
      );
    } else {
      bool isTextFile = foldersAndFiles[index].path.contains(".txt");
      if (isTextFile) {
        final file = File(foldersAndFiles[index].path);
        final data = file.readAsStringSync();
        final content = await showEnterNameDialog(
          "",
          initData: data,
          maxLines: 5,
        );
        if (content != null) {
          file.writeAsString(content);
        }
      }
    }
  }

  void onAddFolderTap() async {
    final folderName = await showEnterNameDialog(
      "Enter folder name:",
      preventSpecialCharacter: true,
    );
    if (folderName != null) {
      final success =
          ExternalStorageHandler.createFolder(param.path, folderName);
      if (success) {
        refreshFoldersAndFiles();
      }
    }
  }

  void onAddFileTap() async {
    final fileName = await showEnterNameDialog(
      "Enter file name:",
      preventSpecialCharacter: true,
    );
    if (fileName != null) {
      final success = ExternalStorageHandler.createFile(param.path, fileName);
      if (success) {
        refreshFoldersAndFiles();
      }
    }
  }

  void onDeleteTap(int index) {
    showConfirmDialog(
      "Are you sure to delete this folder",
      () {
        Nav.pop();
        bool isDirectory = foldersAndFiles[index].statSync().type ==
            FileSystemEntityType.directory;

        final success = isDirectory
            ? ExternalStorageHandler.deleteFolder(
                foldersAndFiles[index].path,
              )
            : ExternalStorageHandler.deleteFile(
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

  void onFilterSelected(FilterTypes value) {
    if (_selectedFilter == value) {
      _selectedFilter = null;
      foldersAndFiles = [...foldersAndFilesCopy];
      notifyListeners();
      return;
    }

    foldersAndFiles = [...foldersAndFilesCopy];
    switch (value) {
      case FilterTypes.textFiles:
        _selectedFilter = value;
        foldersAndFiles =
            foldersAndFiles.where((e) => e.path.contains(".txt")).toList();
        notifyListeners();
      case FilterTypes.images:
        _selectedFilter = value;
        foldersAndFiles = foldersAndFiles
            .where((e) => e.path.contains(RegExp(r"[\w|_|-]+.png|jpg|jpeg")))
            .toList();
        notifyListeners();
    }
  }

  void onSearch(String v) {
    foldersAndFiles = [...foldersAndFilesCopy];
    foldersAndFiles = foldersAndFiles
        .where((e) =>
            e.path.split("/").last.toLowerCase().contains(v.toLowerCase()))
        .toList();
    notifyListeners();
  }

  @override
  void closeModel() {
    searchFocusNode.dispose();
    dispose();
  }
}
