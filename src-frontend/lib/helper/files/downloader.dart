import 'package:websocket_sample/entities/csv.dart';

import 'package:websocket_sample/helper/files/downloader_stub.dart'
    if (dart.library.io) 'package:websocket_sample/helper/files/app_downloader.dart'
    if (dart.library.html) 'package:websocket_sample/helper/files/web_downloader.dart';

abstract class Downloader {
  factory Downloader() => getDownloader();

  Future<void> download(String fileName, Csv data);
}
