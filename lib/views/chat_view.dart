import 'package:attandenceadmin/data/logic/controllers/chat_controller.dart';
import 'package:attandenceadmin/services/socket_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GroupChatScreen extends StatefulWidget {
  final int roomId;

  const GroupChatScreen({
    super.key,
    required this.roomId,
  });

  @override
  State<GroupChatScreen> createState() => _GroupChatScreenState();
}

class _GroupChatScreenState extends State<GroupChatScreen> {
  final ChatController controller = Get.put(ChatController());

  final TextEditingController msgCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      controller.joinRoom(widget.roomId.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Room ${widget.roomId}")),
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
                child: TextFormField(controller: msgCtrl),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  controller.sendMessage(
                    widget.roomId.toString(),
                    msgCtrl.text,
                  );
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
