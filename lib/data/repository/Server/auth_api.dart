import 'package:attandenceadmin/data/repository/api.dart';
import 'package:attandenceadmin/data/repository/api_urls.dart';

class AuthApi {
  static Future<dynamic> addRole({required String roleName}) async {
    return Api().request(
      header: Api.authHeader,
      method: RequestMethod.post,
      url: addRoleUrl,
      payload: {"roleName": roleName},
    );
  }

  // static Future<dynamic> chengePassword({
  //   required String email,
  //   required String oldPassword,
  //   required String newPassword,
  //   required String confirmPassword,
  // }) async {
  //   return Api().request(
  //     header: Api.authHeader,
  //     method: RequestMethod.post,
  //     url: changePasswordUrl,
  //     payload: {
  //       "email_id": email,
  //       "old_password": oldPassword,
  //       "new_password": newPassword,
  //       "confirm_password": confirmPassword,
  //     },
  //   );
  // }
}
