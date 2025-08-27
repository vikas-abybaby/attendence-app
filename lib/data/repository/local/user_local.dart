import 'dart:convert';
import 'dart:developer';
import 'package:attandenceadmin/main.dart';
import 'package:attandenceadmin/data/models/user_model.dart';
import 'package:attandenceadmin/data/logic/controllers/user_controller.dart';

const String userKey = "CURRENT_USER";
const String tokenKey = "USER_TOKEN";

Future setUser(dynamic data) async {
  log("message$data");
  try {
    if (data["user"] != null) {
      await preferences.setString(userKey, jsonEncode(data["user"]));
    }
    if (data['access_token'] != null) {
      await preferences.setString(tokenKey, jsonEncode(data['access_token']));
    }
  } catch (e) {
    log("setUser$e");
  }
}

Future getCurrentUser() async {
  try {
    var data = await jsonDecode(preferences.getString(userKey) ?? '');
    var token = await jsonDecode(preferences.getString(tokenKey) ?? '');

    log("message$data");
    log("message$token");

    if (data != null && token != null) {
      userController.setCurrentUser(UsersModel.fromJson(data), token);
    }
  } catch (e) {
    log("Error:${e.toString()}");
  }
}
