// Dart imports:
import 'dart:io';

// Package imports:
import 'package:path_provider/path_provider.dart';
import 'package:websocket_sample/entities/csv.dart';
import 'package:websocket_sample/helper/files/downloader.dart';
import 'package:external_path/external_path.dart';

class AppDownloader implements Downloader {
  const AppDownloader();

  @override
  Future<void> download(String fileName, Csv data) async {
    final buffer = StringBuffer();

    for (final row in data.toList()) {
      buffer.writeln(row.join(','));
    }

    // MEMO: Androidしか動作しない
    final csvString = buffer.toString();
    final directory = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
    final file = File('$directory/$fileName');
    await file.writeAsString(csvString);
  }
}

Downloader getDownloader() => const AppDownloader();
