import 'dart:developer';
import 'package:attandenceadmin/data/models/attendance_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/snackbar.dart';
import 'package:attandenceadmin/data/models/home_model.dart';
import 'package:attandenceadmin/data/repository/Server/home_api.dart';

HomeController homeController = HomeController();

class HomeController extends GetxController {
  var homeList = <HomeModel>[].obs;

  Future<void> fetchHome() async {
    await HomeApi.getHome().then((onValue) {
      if (onValue is List) {
        homeList.value = List<HomeModel>.from(
          onValue.map((e) => HomeModel.fromJson(e)),
        );
      }
    }).catchError((onError) {
      SnackBarData.topShowSnackBar('Error :- $onError', Colors.redAccent);
    });
    update();
  }

  Future<void> attendanceMark({
    required String lat,
    required String long,
    required String location,
  }) async {
    await HomeApi.attendanceMark(lat: lat, long: long, location: location)
        .then((onValue) async {
      if (onValue is List) {
        await attendanceToday();
      }
    }).catchError((onError) {
      SnackBarData.topShowSnackBar('Error :- $onError', Colors.redAccent);
    });
    update();
  }

  Attendance? todayAttendance;

  Future<void> attendanceToday() async {
    await HomeApi.attendanceToday().then((onValue) {
      if (onValue is Map) {
        todayAttendance =
            Attendance.fromJson(Map<String, dynamic>.from(onValue));
      } else {
        todayAttendance = null;
      }
    }).catchError((onError) {
      log("onError$onError");
      SnackBarData.topShowSnackBar(
        'Error :- $onError',
        Colors.redAccent,
      );
    });
    update();
  }
}
