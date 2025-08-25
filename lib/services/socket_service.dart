import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketService {
  static final SocketService _instance = SocketService._internal();
  late IO.Socket socket;

  factory SocketService() {
    return _instance;
  }

  SocketService._internal();

  void connect(String url) {
    socket = IO.io(
      url,
      IO.OptionBuilder().setTransports(['websocket']).enableAutoConnect().build(),
    );

    socket.connect();

    socket.onConnect((_) {
      print("🟢 Socket connected: ${socket.id}");
    });

    socket.onDisconnect((_) {
      print("🔴 Socket disconnected");
    });
  }
}
