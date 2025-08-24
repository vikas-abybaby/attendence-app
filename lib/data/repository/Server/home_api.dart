import 'dart:ffi';

import 'package:attandenceadmin/data/repository/api.dart';
import 'package:attandenceadmin/data/repository/api_urls.dart';

class HomeApi {
  static Future<dynamic> getHome() async {
    return Api().request(
      header: Api().commonHeader,
      method: RequestMethod.get,
      url: getHomeUrl,
    );
  }

  static Future<dynamic> attendanceMark(
      {required String lat,
      required String long,
      required String location,
      int? absent}) async {
    return Api().request(
      header: Api().commonHeader,
      method: RequestMethod.post,
      url: attendanceMarkUrl,
      payload: {
        "location": location,
        "lat": lat,
        "long": long,
        if (absent != null) "absent": absent
      },
    );
  }

  static Future<dynamic> attendanceToday() async {
    return Api().request(
      header: Api().commonHeader,
      method: RequestMethod.get,
      url: attendanceTodayUrl,
    );
  }
}
