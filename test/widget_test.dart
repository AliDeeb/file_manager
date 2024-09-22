// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:file_manager/core/common/external_storage_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("Create and delete folder/file", () {
    test("Create file", () async {
      final isSuccess =
          ExternalStorageHandler.createFile("./test", "test2.txt");
      expect(isSuccess, true);
    });

    test("Create folder", () async {
      final isSuccess =
          ExternalStorageHandler.createFolder("./test", "folderTest");
      expect(isSuccess, true);
    });

    test("Delete file", () async {
      final isSuccess = ExternalStorageHandler.deleteFile("./test/test2.txt");
      expect(isSuccess, true);
    });

    test("Delete folder", () async {
      final isSuccess =
          ExternalStorageHandler.deleteFolder("./test/folderTest");
      expect(isSuccess, true);
    });
  });
}
