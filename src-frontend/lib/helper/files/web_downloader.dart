// Dart imports:
import 'dart:convert';
import 'dart:html';

// Package imports:
import 'package:csv/csv.dart';

// Project imports:
import 'package:websocket_sample/entities/csv.dart';

class WebDownloader {
  const WebDownloader();

  Future<void> download(String fileName, Csv data) async {
    // 配列データをCSV形式に変換
    final csvData = const ListToCsvConverter().convert(data.toList());

    final blob = Blob([utf8.encode(csvData)]);
    final url = Url.createObjectUrlFromBlob(blob);
    AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
    Url.revokeObjectUrl(url);
  }
}
