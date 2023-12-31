// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laravel_echo/laravel_echo.dart';

// Project imports:
import 'package:websocket_sample/entities/csv.dart';
import 'package:websocket_sample/helper/logger.dart';
import 'package:websocket_sample/providers/file_system_provider.dart';
import 'package:websocket_sample/providers/overlay_entry_provider.dart';
import 'package:websocket_sample/providers/web_socket_provider.dart';
import 'package:websocket_sample/repositories/csv_repository.dart';

final csvRepositoryProvider = Provider<CsvRepository>((ref) => CsvRepository());

final csvWebSocketProvider = Provider<Echo>((ref) {
  final echo = ref.watch(webSocketProvider);

  echo.channel('csv').listen('.csv-creating', (e) {
    final Map<String, dynamic> eventData = e;
    ref.read(progressProvider.notifier).state = eventData['progress'];
    logger.i('進捗: ${eventData["progress"]}');
    final currentOverlayEntry = ref.read(overlayEntryProvider.notifier).state;
    currentOverlayEntry?.markNeedsBuild();
  });

  echo.channel('csv').listen('.csv-download', (e) {
    ref.read(overlayEntryProvider.notifier).state?.remove();
    final Map<String, dynamic> eventData = e;

    final Csv csvData = Csv(eventData['data'] as List);

    ref.read(fileSystemProvider).download('sample.csv', csvData);
  });

  return echo;
});
