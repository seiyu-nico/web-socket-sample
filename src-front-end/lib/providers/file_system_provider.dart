// Flutter imports:

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:websocket_sample/helper/files/app_downloader.dart';
import 'package:websocket_sample/helper/files/web_downloader.dart';

final fileSystemProvider = Provider((ref) {
  // TODO: アプリ対応したらそれぞれ分ける
  return WebDownloader();
  // return AppDownloader();
});
