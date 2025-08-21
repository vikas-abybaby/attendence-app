import 'dart:developer';

import 'package:attandenceadmin/data/controllers/home_controller.dart';
import 'package:attandenceadmin/data/controllers/location_controller.dart';
import 'package:attandenceadmin/data/repository/api.dart';
import 'package:attandenceadmin/data/repository/api_urls.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:attandenceadmin/config/Router/page_router.dart';
import 'package:attandenceadmin/data/repository/local/user_local.dart';
import 'package:workmanager/workmanager.dart';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    log("✅ Background task triggered: $task ${DateTime.now().toString()}");
    await locationController.updateLatLong();
    return Future.value(true);
  });
}

late SharedPreferences preferences;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true,
  );

  await Workmanager().registerPeriodicTask(
    "uniqueTaskName",
    "fetchLocation",
    frequency: Duration(minutes: 15),
  );

  preferences = await SharedPreferences.getInstance();
  await getCurrentUser();
  await locationController.startLocationTracking();


  Get.put(HomeController());
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoRouter router = PageRouter().goRouter;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      routerDelegate: router.routerDelegate,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      debugShowCheckedModeBanner: false,
    );
  }
}
