import 'dart:developer';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/snackbar.dart';
import 'package:attandenceadmin/data/models/home_model.dart';
import 'package:attandenceadmin/data/repository/Server/home_api.dart';

class HomeController extends GetxController {
  var homeList = <HomeModel>[].obs;

  @override
  void onInit() {
    fetchHome();
    super.onInit();
  }

  Future<void> fetchHome() async {
    await HomeApi.getHome()
        .then((onValue) {
          if (onValue is List) {
            homeList.value = List<HomeModel>.from(
              onValue.map((e) => HomeModel.fromJson(e)),
            );
          }
        })
        .catchError((onError) {
          SnackBarData.topShowSnackBar('Error :- $onError', Colors.redAccent);
        });
    update();
  }
}
