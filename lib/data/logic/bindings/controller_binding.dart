import 'package:attandenceadmin/data/logic/controllers/chat_controller.dart';
import 'package:attandenceadmin/data/logic/controllers/home_controller.dart';
import 'package:attandenceadmin/data/logic/controllers/location_controller.dart';
import 'package:get/get.dart';

class ControllerBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<LocationController>(() => LocationController());
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
