// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
// Project imports:
import 'package:websocket_sample/helper/files/downloader.dart';

final fileSystemProvider = Provider((ref) {
  return Downloader();
});
