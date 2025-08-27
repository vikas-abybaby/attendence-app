import 'dart:developer';

import 'package:attandenceadmin/data/models/message_model.dart';
import 'package:attandenceadmin/services/socket_service.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <MessageModel>[].obs;
  final _socket = SocketService();

  @override
  void onInit() {
    super.onInit();
    _socket.connect();
  }

  void joinRoom(String roomId) {
    _socket.joinRoom(roomId);
    log("message");
  }

  void sendMessage(String roomId, String text) {
    // messages.add(MessageModel.fromJson({"senderId": 1, "text": text}));
      log("sendMessage$roomId");

    try {
      _socket.sendMessage(roomId, text);
    } catch (e) {
      log("sendMessage$e");
    }
  }
}
