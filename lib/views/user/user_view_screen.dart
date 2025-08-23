import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/data/models/user_model.dart';
import 'package:attandenceadmin/data/logic/controllers/user_controller.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    log("userController length: ${userController.userList.length}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Management'),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Obx(() {
        if (userController.userList.isEmpty) {
          return const Center(child: Text("No users found"));
        }

        return LayoutBuilder(
          builder: (context, constraints) {
            // Dynamically calculate how many items fit based on width
            final double width = constraints.maxWidth;
            final int crossAxisCount = width ~/ 350; // ~350 px per card
            final double childAspectRatio = 1.8;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount > 1 ? crossAxisCount : 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: childAspectRatio,
                ),
                itemCount: userController.userList.length,
                itemBuilder: (BuildContext context, int index) {
                  final UsersModel user = userController.userList[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 28,
                            backgroundColor: Colors.blueGrey,
                            backgroundImage:
                                (user.profilePicUrl != null &&
                                    user.profilePicUrl!.isNotEmpty &&
                                    user.profilePicUrl != "null")
                                ? NetworkImage(user.profilePicUrl!)
                                      as ImageProvider
                                : const AssetImage(
                                    "assets/images/avatar_placeholder.png",
                                  ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                barlowBold(
                                  text: user.name ?? "Unnamed",
                                  color: black,
                                  size: 16,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  user.email ?? "No email",
                                  style: TextStyle(color: Colors.grey[700]),
                                ),
                                const SizedBox(height: 10),
                                Wrap(
                                  spacing: 10,
                                  runSpacing: 6,
                                  children: [
                                    _buildInfoChip("Role", user.role),
                                    _buildInfoChip("Emp ID", user.employeeId),
                                  ],
                                ),
                                const SizedBox(height: 6),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      size: 16,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 6),
                                    Text(
                                      user.phone ?? "-",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      }),
    );
  }

  Widget _buildInfoChip(String label, String? value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        "$label: ${value ?? '-'}",
        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }
}
