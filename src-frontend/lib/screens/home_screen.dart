// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

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
                PermissionStatus status = await Permission.storage.status;
                if (status.isDenied) {
                  // ユーザーが以前に拒否した場合や、まだ許可を要求していない場合
                  status = await Permission.storage.request();
                }

                if (status.isDenied) {
                  return;
                }

                final csvRepository = ref.read(csvRepositoryProvider);
                final overlay = Overlay.of(context);
                final overlayEntry = OverlayEntry(builder: (context) {
                  final progress = ref.watch(progressProvider);
                  return Progress(progress: progress);
                });
                logger.i("オーバーレイ表示");
                overlay.insert(overlayEntry);
                ref.read(overlayEntryProvider.notifier).state = overlayEntry;

                final response = await csvRepository.download();
              },
              child: const Text('CSVダウンロード'),
            ),
          ],
        ),
      ),
    );
  }
}
