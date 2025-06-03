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
}
