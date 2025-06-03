import 'package:flutter/cupertino.dart';
import 'package:attandenceadmin/data/repository/api.dart';
import 'package:attandenceadmin/data/repository/api_urls.dart';

class UserApi {
  static Future<dynamic> getUser() async {
    return Api().request(
      header: Api.authHeader,
      method: RequestMethod.get,
      url: getUsersUrl,
    );
  }

  static Future<dynamic> getLogin(String email, String password) async {
    return Api().request(
      header: Api.authHeader,
      method: RequestMethod.post,
      url: getLoginUrl,
      payload: {"email": email, "password": password},
    );
  }
}
