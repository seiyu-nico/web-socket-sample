// Package imports:
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:laravel_echo/laravel_echo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

// Project imports:
import 'package:websocket_sample/config/url_config.dart';

final webSocketProvider = Provider<Echo>((ref) {
  IO.Socket socket = IO.io(
    UrlConfig.websocketUrl,
    IO.OptionBuilder()
        .disableAutoConnect()
        .setTransports(['websocket']).build(),
  );
// Create echo instance
  Echo echo = Echo(
    broadcaster: EchoBroadcasterType.SocketIO,
    client: socket,
  );
  socket.onConnect((data) {
    print("WebSocket Connected");
  });

  socket.onConnectError((data) {
    print("Connection Error: $data");
  });

  socket.onDisconnect((data) {
    print("Disconnected: $data");
  });

  socket.on('error', (data) {
    print("Error: $data");
  });

  return echo;
});
