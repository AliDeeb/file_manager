import 'dart:io';

import '../../../core/common/external_storage_handler.dart';
import '../../../core/common/view_model/base_view_model.dart';
import '../view/folder_file/folder_file_view.dart';

class FolderFileViewModel extends BaseViewModel<FolderFileViewParam> {
  FolderFileViewModel(super.param) {
    rootFoldersAndFiles = ExternalStorageHandler.getFoldersAndFiles(param.path);
  }

  List<FileSystemEntity> rootFoldersAndFiles = [];

  @override
  void closeModel() {
    dispose();
  }
}
