// Dart imports:
import 'dart:io';

// Package imports:
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

// TODO: 動作未確認
class AppDownloader {
  const AppDownloader();

  Future<void> download(String fileName, List<List<String>> data) async {
    if (await Permission.storage.request().isGranted) {
      // ストレージへのアクセス許可が得られた場合の処理
    }

    final buffer = StringBuffer();

    for (final row in data) {
      buffer.writeln(row.join(','));
    }

    final csvString = buffer.toString();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csvString);
  }
}
