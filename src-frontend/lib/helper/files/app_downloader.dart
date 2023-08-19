// Dart imports:
import 'dart:io';

// Package imports:
import 'package:path_provider/path_provider.dart';
import 'package:websocket_sample/entities/csv.dart';
import 'package:websocket_sample/helper/files/downloader.dart';

class AppDownloader implements Downloader {
  const AppDownloader();

  @override
  Future<void> download(String fileName, Csv data) async {
    final buffer = StringBuffer();

    for (final row in data.toList()) {
      buffer.writeln(row.join(','));
    }

    final csvString = buffer.toString();
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/$fileName');
    await file.writeAsString(csvString);
  }
}

Downloader getDownloader() => const AppDownloader();
