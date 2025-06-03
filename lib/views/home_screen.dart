import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/data/models/home_model.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';
import 'package:attandenceadmin/data/controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: barlowBold(text: "Dashboard", color: white, size: 20),
        backgroundColor: deepPurple,
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: homeController.homeList.length,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemBuilder: (context, index) {
            HomeModel item = homeController.homeList[index];
            return InkWell(
              onTap: () {
                RoutingService().pushNamed(item.routes ?? "");
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                color: Colors.blueGrey[50],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.count.toString(),
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      barlowBold(
                        text: item.title ?? "",
                        color: black,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
