import 'dart:ui';
import 'dart:developer';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/data/controllers/user_controller.dart';
import 'package:attandenceadmin/data/logic/controllers/home_controller.dart';
import 'package:attandenceadmin/data/logic/controllers/location_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      homeController.updateTime();
      await homeController.attendanceToday();
    });
  }

  @override
  Widget build(BuildContext context) {
    final LocationController locationController =
        Get.find<LocationController>();
    return Scaffold(
      body: GetBuilder<HomeController>(builder: (controller) {
        return Container(
          width: fullWidth(context),
          height: fullHeight(context),
          alignment: Alignment.topCenter,
          color: white,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    width: fullWidth(context),
                    height: fullHeight(context) / 2.5,
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
                          const Gap(20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Center(
                                child: Obx(
                                  () => barlowBold(
                                      text: controller.time.string,
                                      color: black,
                                      size: 25,
                                      textAlign: TextAlign.center),
                                ),
                              ),
                              if ((controller.todayAttendance?.checkIn ==
                                          false ||
                                      controller.todayAttendance?.checkOut ==
                                          false) &&
                                  controller.todayAttendance?.absent == false)
                                Row(
                                  spacing: 5,
                                  children: [
                                    if ((controller.todayAttendance?.absent ==
                                            false) &&
                                        (controller.todayAttendance?.checkOut ==
                                            false))
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: darkblue,
                                        ),
                                        onPressed: () {
                                          Future.delayed(Duration.zero,
                                              () async {
                                            await controller.attendanceMark(
                                              lat:
                                                  (locationController.latLong ??
                                                          "")
                                                      .split(",")[0],
                                              long:
                                                  (locationController.latLong ??
                                                          "")
                                                      .split(",")[1],
                                              location:
                                                  (locationController.area ??
                                                      ""),
                                            );
                                          });
                                        },
                                        child: barlowBold(
                                          text: (controller.todayAttendance
                                                          ?.checkIn ==
                                                      false &&
                                                  controller.todayAttendance
                                                          ?.checkOut ==
                                                      false)
                                              ? "Check In"
                                              : ((controller.todayAttendance
                                                              ?.checkIn ??
                                                          false) &&
                                                      controller.todayAttendance
                                                              ?.checkOut ==
                                                          false)
                                                  ? "Check Out"
                                                  : "",
                                          color: white,
                                          size: 12,
                                        ),
                                      ),
                                    if ((controller.todayAttendance?.checkIn ==
                                            false) &&
                                        (controller.todayAttendance?.absent ==
                                            false))
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: red,
                                        ),
                                        onPressed: () {
                                          Future.delayed(Duration.zero,
                                              () async {
                                            await controller.attendanceMark(
                                              lat:
                                                  (locationController.latLong ??
                                                          "")
                                                      .split(",")[0],
                                              long:
                                                  (locationController.latLong ??
                                                          "")
                                                      .split(",")[1],
                                              location:
                                                  (locationController.area ??
                                                      ""),
                                              absent: 1,
                                            );
                                          });
                                        },
                                        child: barlowBold(
                                          text: "Absent",
                                          color: white,
                                          size: 12,
                                        ),
                                      ),
                                  ],
                                ),
                            ],
                          ),
                          if ((controller.todayAttendance?.checkOut ?? false) ||
                              (controller.todayAttendance?.absent ?? false))
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                              color: white,
                              alignment: Alignment.center,
                              child: barlowBold(
                                text:
                                    "You have successfully completed today’s attendance.",
                                color: green,
                                size: 15,
                                textAlign: TextAlign.center,
                              ),
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
                                      color: green,
                                      size: 35,
                                    ),
                                    barlowBold(
                                      text: formatTimeAmPm(controller
                                                  .todayAttendance
                                                  ?.checkInTime ??
                                              "") ??
                                          "",
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
                                      color: red,
                                      size: 35,
                                    ),
                                    barlowBold(
                                      text: formatTimeAmPm(controller
                                                  .todayAttendance
                                                  ?.checkOutTime ??
                                              "") ??
                                          "",
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
                                      color: deepPurple,
                                      size: 35,
                                    ),
                                    barlowBold(
                                      text: getWorkingHours(
                                          controller.todayAttendance
                                                  ?.checkInTime ??
                                              "",
                                          controller.todayAttendance
                                                  ?.checkOutTime ??
                                              ""),
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
              const Gap(10),
              Column(
                children: [
                  Row(
                    children: [
                      const Gap(20),
                      Expanded(
                        child: barlowBold(
                          text: "Monthly Reports",
                          size: 18,
                          color: black,
                        ),
                      ),
                      Icon(
                        Icons.calendar_month,
                        size: 25,
                        color: black,
                      ),
                      const Gap(20),
                    ],
                  ),
                  const Gap(2),
                  Row(
                    spacing: 10,
                    children: [
                      const Gap(10),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: fullHeight(context) / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: green,
                              ),
                              alignment: Alignment.center,
                              child: barlowBold(
                                text: (controller
                                        .todayAttendance?.monthWithoutLate)
                                    .toString(),
                                size: 50,
                                color: black,
                              ),
                            ),
                            barlowBold(
                              text: "OnTime",
                              size: 15,
                              color: black,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: fullHeight(context) / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: yellow,
                              ),
                              alignment: Alignment.center,
                              child: barlowBold(
                                text: (controller.todayAttendance?.monthLate)
                                    .toString(),
                                size: 50,
                                color: black,
                              ),
                            ),
                            barlowBold(
                              text: "Late",
                              size: 15,
                              color: black,
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              height: fullHeight(context) / 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: red,
                              ),
                              alignment: Alignment.center,
                              child: barlowBold(
                                text: (controller.todayAttendance?.monthAbsent)
                                    .toString(),
                                size: 50,
                                color: black,
                              ),
                            ),
                            barlowBold(
                              text: "Absent",
                              size: 15,
                              color: black,
                            ),
                          ],
                        ),
                      ),
                      const Gap(10),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              Column(
                children: [
                  Row(
                    children: [
                      const Gap(20),
                      Expanded(
                        child: barlowBold(
                          text: "Today Meetings",
                          size: 18,
                          color: black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: black,
                      ),
                      const Gap(20),
                    ],
                  ),
                  const Gap(2),
                  SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    child: Row(
                        spacing: 10,
                        children: List.generate(
                          5,
                          (index) => Container(
                            decoration: BoxDecoration(
                              color: getRandomColor().withOpacity(.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    barlowRegular(
                                      text: "12:20 PM",
                                      color: black,
                                      size: 15,
                                    ),
                                    barlowRegular(
                                      text: " - ",
                                      color: black,
                                      size: 15,
                                    ),
                                    barlowRegular(
                                      text: "01:20 PM",
                                      color: black,
                                      size: 15,
                                    ),
                                  ],
                                ),
                                barlowBold(
                                  text: "Pms Setup Meating",
                                  color: black,
                                  size: 20,
                                ),
                                barlowRegular(
                                  text: "12 Members Joined",
                                  color: black,
                                  size: 15,
                                ),
                                const Gap(20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: fullWidth(context) / 5,
                                          padding: EdgeInsets.all(1),
                                          alignment: Alignment.centerLeft,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: black,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 35,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: green,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 20,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: yellow,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 5,
                                          child: Container(
                                            width: 30,
                                            height: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: red,
                                            ),
                                            alignment: Alignment.center,
                                            child: barlowBold(
                                                text: "3+",
                                                color: white,
                                                size: 15),
                                          ),
                                        )
                                      ],
                                    ),
                                    const Gap(20),
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: getRandomColor(),
                                      ),
                                      onPressed: () {},
                                      child: barlowRegular(
                                        text: "Join",
                                        color: white,
                                        size: 15,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
