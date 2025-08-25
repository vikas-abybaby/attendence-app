import 'package:attandenceadmin/data/logic/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatView extends StatelessWidget {
  final String roomId;
  final String userId;
  final String name;
  final ChatController controller = Get.put(ChatController());

  ChatView({
    super.key,
    required this.roomId,
    required this.userId,
    required this.name,
  });

  final TextEditingController msgCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    controller.initSocket(roomId, userId, name);

    return Scaffold(
      appBar: AppBar(title: Text("Room $roomId")),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final msg = controller.messages[index];
                  return ListTile(
                    title: Text(msg.text),
                    subtitle: Text(msg.senderId),
                  );
                },
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(controller: msgCtrl),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  if (msgCtrl.text.isNotEmpty) {
                    controller.sendMessage(roomId, msgCtrl.text, userId);
                    msgCtrl.clear();
                  }
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
