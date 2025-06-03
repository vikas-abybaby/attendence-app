import 'package:gap/gap.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/components/text_field.dart';
import 'package:attandenceadmin/data/repository/Server/auth_api.dart';

class RoleAddScreen extends StatefulWidget {
  const RoleAddScreen({super.key});

  @override
  State<RoleAddScreen> createState() => _RoleAddScreenState();
}

class _RoleAddScreenState extends State<RoleAddScreen> {
  TextEditingController roleNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        children: [
          TextFieldData(
            controller: roleNameController,
            hintText: "Role Name",
            label: "Enter Role Name",
          ),
          const Gap(10),
          ElevatedButton(
            onPressed: () {
              Future.delayed(Duration.zero, () async {
                await AuthApi.addRole(roleName: roleNameController.text);
              });
            },
            child: barlowBold(text: "Add Role"),
          ),
        ],
      ),
    );
  }
}
