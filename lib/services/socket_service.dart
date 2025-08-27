import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  factory SocketService() => _instance;
  SocketService._internal();

  IO.Socket? _socket;

  void connect() {
    _socket = IO.io(
      "http://192.168.0.107:8001",
      IO.OptionBuilder()
          .setTransports(["websocket"])
          .disableAutoConnect()
          .build(),
    );

    _socket!.connect();

    _socket!.onConnect((_) => log("✅ Connected to socket server"));
    _socket!.onDisconnect((_) => log("❌ Disconnected"));

    _socket!.on("message", (data) {
      log("💬 New message: $data");
    });

    _socket!.on("typing", (data) {
      log("⌨️ Typing: $data");
    });
  }

  void joinRoom(String roomId) {
    _socket?.emit("join", {"roomId": roomId});
  }

  void sendMessage(String roomId, String text) {
    _socket?.emit("message", {"roomId": roomId, "text": text});
  }

  void typing(String roomId, bool isTyping) {
    _socket?.emit("typing", {"roomId": roomId, "isTyping": isTyping});
  }

  void disconnect() {
    _socket?.disconnect();
  }
}
