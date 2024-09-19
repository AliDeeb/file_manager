import 'dart:io';

import '../../../core/common/view_model/base_view_model.dart';
import '../view/home/home_view.dart';

class HomeViewModel extends BaseViewModel<HomeViewParam> {
  HomeViewModel(super.param);
  List<FileSystemEntity> rootFoldersAndFiles = [];

  @override
  void closeModel() {
    dispose();
  }
}
