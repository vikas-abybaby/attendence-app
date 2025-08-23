import 'dart:developer';
import 'package:attandenceadmin/data/models/attendance_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/snackbar.dart';
import 'package:attandenceadmin/data/models/home_model.dart';
import 'package:attandenceadmin/data/repository/Server/home_api.dart';
import 'package:intl/intl.dart';

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

  Future<void> attendanceMark(
      {required String lat,
      required String long,
      required String location,
      int? absent}) async {
    await HomeApi.attendanceMark(
            lat: lat, long: long, location: location, absent: absent)
        .then((onValue) async {
      if (onValue is Map) {
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

  var time = "".obs;

  void updateTime() {
    Future.delayed(const Duration(seconds: 1), () {
      final nowUtc = DateTime.now().toUtc();
      final indiaTime = nowUtc.add(const Duration(hours: 5, minutes: 30));
      time.value = DateFormat("HH:mm:ss").format(indiaTime);
      updateTime();
    });
  }
}
