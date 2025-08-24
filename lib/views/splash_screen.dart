import 'package:attandenceadmin/data/logic/controllers/location_controller.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';
import 'package:attandenceadmin/config/Router/page_router_name.dart';
import 'package:attandenceadmin/data/logic/controllers/user_controller.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  LocationController locationController = Get.find<LocationController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await locationController.startLocationTracking();

      if (userController.currentUser.value != null) {
        RoutingService().goName(Routes.homeScreen.name);
      } else {
        RoutingService().goName(Routes.loginScreen.name);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
