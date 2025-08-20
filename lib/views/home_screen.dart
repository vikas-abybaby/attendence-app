import 'dart:ui';

import 'package:attandenceadmin/data/controllers/location_controller.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/data/models/home_model.dart';
import 'package:attandenceadmin/config/Router/routing_service.dart';
import 'package:attandenceadmin/data/controllers/home_controller.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await locationController.updateLatLong();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: fullWidth(context),
        height: fullHeight(context),
        alignment: Alignment.topCenter,
        color: white,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: fullWidth(context),
              height: fullHeight(context) / 2,
              color: white,
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: fullWidth(context),
                height: fullHeight(context) / 4,
                child: AppBar(
                  backgroundColor: darkblue,
                  title: barlowBold(
                    text: "Vikash Kumar",
                    color: white,
                    size: 12,
                  ),
                  actionsPadding: EdgeInsets.only(right: 10),
                  actions: [
                    IconButton(
                        style: IconButton.styleFrom(
                            backgroundColor: grey.withOpacity(.4)),
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: white,
                          size: 20,
                        ))
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: fullWidth(context) / 1.1,
                height: fullHeight(context) / 3,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 2,
                        color: grey,
                        offset: Offset(.5, .5),
                        spreadRadius: .5)
                  ],
                  color: white,
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      color: white,
                      child: barlowBold(
                        text:
                            "Permissions enable auto check-in for accurate attendance.",
                        color: red,
                        size: 12,
                      ),
                    ),
                    const Gap(20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        barlowBold(
                          text: "06:20:20 PM",
                          color: black,
                          size: 25,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: darkblue),
                          onPressed: () {},
                          child: barlowBold(
                            text: "Check In",
                            color: white,
                            size: 12,
                          ),
                        )
                      ],
                    ),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_alarm_outlined,
                                color: darkblue,
                                size: 35,
                              ),
                              barlowBold(
                                text: DateFormat('hh:mm a').format(DateTime.now()),
                                color: black,
                                size: 12,
                              ),
                              barlowRegular(
                                text: "Check In",
                                color: black,
                                size: 10,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_alarm_outlined,
                                color: darkblue,
                                size: 35,
                              ),
                              barlowBold(
                                text: "06:20 PM",
                                color: black,
                                size: 12,
                              ),
                              barlowRegular(
                                text: "Check Out",
                                color: black,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 100,
                          color: white,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.access_alarm_outlined,
                                color: darkblue,
                                size: 35,
                              ),
                              barlowBold(
                                text: "9 hr",
                                color: black,
                                size: 12,
                              ),
                              barlowRegular(
                                text: "Working HR's",
                                color: black,
                                size: 10,
                              )
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
