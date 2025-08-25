import 'package:attandenceadmin/services/socket_service.dart';
import 'package:get/get.dart';
import 'package:attandenceadmin/data/models/message_model.dart';

class ChatController extends GetxController {
  var messages = <MessageModel>[].obs;
  final socketService = SocketService();

  void initSocket(String roomId, String userId, String name) {
    socketService.socket.emit("join", {
      "roomId": roomId,
      "userId": userId,
      "name": name,
    });

    socketService.socket.on("history", (data) {
      messages.value = (data as List)
          .map((msg) => MessageModel.fromJson(msg))
          .toList();
    });

    socketService.socket.on("message", (data) {
      messages.add(MessageModel.fromJson(data));
    });
  }

  void sendMessage(String roomId, String text, String senderId) {
    socketService.socket.emit("message", {
      "roomId": roomId,
      "text": text,
      "senderId": senderId,
    });
  }
}


