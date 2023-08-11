// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:websocket_sample/helper/logger.dart';
import 'package:websocket_sample/providers/csv_provider.dart';

/// TOP画面
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(csvWebSocketProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('WebSocket Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final csvRepository = ref.read(csvRepositoryProvider);
                final response = await csvRepository.download();
                logger.i(response);
              },
              child: const Text('CSVダウンロード'),
            ),
          ],
        ),
      ),
    );
  }
}
