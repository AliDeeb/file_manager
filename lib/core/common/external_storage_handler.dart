import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import '../navigation/nav.dart';
import '../ui/show_toast.dart';
import 'app_config.dart';

class ExternalStorageHandler {
  static String? _rootPath;

  static String? get rootPath => _rootPath;

  static Future<bool> requestStoragePermssion() async {
    return await Permission.storage.request().isGranted;
  }

  static Future<String?> getRootPath() async {
    final isGranted = await requestStoragePermssion();

    if (isGranted) {
      final root = (await getExternalStorageDirectory())
          ?.uri
          .pathSegments
          .getRange(0, 3)
          .join("/");
      _rootPath = root;
      return _rootPath;
    } else {
      await showDialog(
        context: AppConfig.appNavigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
            title: const Text("Allow to access to external storage"),
            actions: [
              const TextButton(onPressed: Nav.pop, child: Text("cancel")),
              FilledButton(
                onPressed: () async {
                  await openAppSettings();
                  Nav.pop();
                },
                child: const Text("openAppSettings"),
              ),
            ],
          );
        },
      );

      if (await requestStoragePermssion()) {
        final root = (await getExternalStorageDirectory())
            ?.uri
            .pathSegments
            .getRange(0, 3)
            .join("/");
        _rootPath = root;
        return _rootPath;
      }
    }
    return null;
  }

  static List<FileSystemEntity> getFoldersAndFiles(String path) {
    return Directory(path).listSync();
  }

  static List<FileSystemEntity> getRootFoldersAndFiles() {
    if (_rootPath == null) return [];
    return Directory(_rootPath!).listSync();
  }

  static bool canOpenDirectory(String path) {
    try {
      Directory(path).listSync();
      return true;
    } catch (e) {
      return false;
    }
  }

  static bool createFolder(String path, String folderName) {
    final folder = Directory("$path/$folderName");
    if (folder.existsSync()) {
      showToast("folder is exist");
      return false;
    } else {
      try {
        folder.createSync();
        return true;
      } catch (e) {
        showToast("Error occure when trying create folder");
        return false;
      }
    }
  }

  static bool deleteFolder(String path) {
    try {
      final folder = Directory(path);
      try {
        folder.deleteSync();
        return true;
      } catch (e) {
        showToast("Error occure when trying delete folder");
        return false;
      }
    } catch (e) {
      showToast("Error occure when trying delete folder");
      return false;
    }
  }
}
