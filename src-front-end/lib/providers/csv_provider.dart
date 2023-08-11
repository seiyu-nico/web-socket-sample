// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laravel_echo/laravel_echo.dart';

// Project imports:
import 'package:websocket_sample/helper/logger.dart';
import 'package:websocket_sample/providers/web_socket_provider.dart';
import 'package:websocket_sample/repositories/csv_repository.dart';

final csvRepositoryProvider = Provider<CsvRepository>((ref) {
  return CsvRepository();
});

final csvWebSocketProvider = Provider<Echo>((ref) {
  final echo = ref.watch(webSocketProvider);
  echo.channel('csv').listen('.csv-creating', (e) {
    final Map<String, dynamic> eventData = e;
    logger.i(eventData);
  });

  echo.channel('csv').listen('.csv-download', (e) {
    final Map<String, dynamic> eventData = e;
    logger.i(eventData);
  });

  return echo;
});
