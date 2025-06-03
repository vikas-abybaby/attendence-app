import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/snackbar.dart';
import 'package:attandenceadmin/data/models/user_model.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';
import 'package:attandenceadmin/config/Router/page_router_name.dart';
import 'package:attandenceadmin/data/repository/Server/user_api.dart';
import 'package:attandenceadmin/data/repository/local/user_local.dart';

UserController userController = UserController();

class UserController extends GetxController {
  var userList = <UsersModel>[].obs;
  var currentUser = Rxn<UsersModel>();
  var token = ''.obs;
  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  Future<void> fetchUsers() async {
    await UserApi.getUser()
        .then((onValue) {
          log("onValue :- $onValue");
          if (onValue is List) {
            userList.value = List<UsersModel>.from(
              onValue.map((e) => UsersModel.fromJson(e)),
            );
          }
        })
        .catchError((onError) {
          SnackBarData.topShowSnackBar('Error :- $onError', Colors.redAccent);
        });

    update();
  }

  Future<void> loginUser(String email, String password) async {
    await UserApi.getLogin(email, password)
        .then((onValue) {
          if (onValue != null &&
              onValue['data'] != null &&
              onValue["access_token"] != null) {
            currentUser.value = UsersModel.fromJson(onValue['data']);
            token.value = onValue["access_token"];
            setUser(onValue);
            RoutingService().goName(Routes.homeScreen.name);
          }
        })
        .catchError((onError) {
          SnackBarData.topShowSnackBar(
            "Server Error: $onError",
            Colors.redAccent,
          );
        });
    // log("Login Response: $response");

    // if (response != null && response['token'] != null) {
    //   // Save token
    //   storage.write('token', response['token']);

    //   // Optionally save user info
    //   storage.write('user', response['user']);

    //   SnackBarData.topShowSnackBar('Login Successful', Colors.green);
    //   Get.offAllNamed('/home'); // navigate to Home
    // } else {
    //   SnackBarData.topShowSnackBar('Login failed', Colors.redAccent);
    // }
  }

  // nullable reactive user

  void setCurrentUser(UsersModel user, String accesstoken) {
    currentUser.value = user;
    token.value = accesstoken;
    update();
  }
}
