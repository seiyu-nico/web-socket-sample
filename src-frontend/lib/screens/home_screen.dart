// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Project imports:
import 'package:websocket_sample/components/overlay/progress.dart';
import 'package:websocket_sample/helper/logger.dart';
import 'package:websocket_sample/providers/csv_provider.dart';
import 'package:websocket_sample/providers/overlay_entry_provider.dart';

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

                final overlay = Overlay.of(context);
                final overlayEntry = OverlayEntry(builder: (context) {
                  final progress = ref.watch(progressProvider);
                  return Progress(progress: progress);
                });
                overlay.insert(overlayEntry);
                ref.read(overlayEntryProvider.notifier).state = overlayEntry;
              },
              child: const Text('CSVダウンロード'),
            ),
          ],
        ),
      ),
    );
  }
}
