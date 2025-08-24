import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:attandenceadmin/components/widget.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:attandenceadmin/data/controllers/user_controller.dart';
import 'package:attandenceadmin/data/controllers/location_controller.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      await userController.profileUser();
      // await locationController.updateLatLong();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.deepPurple.shade400,
              child: Icon(
                Icons.location_on,
                color: white,
                size: 22,
              ),
            ),
            const Gap(5),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  barlowRegular(
                    text: "Location",
                    color: white,
                    size: 15,
                  ),
                  const Gap(2),
                  barlowBold(
                    text: locationController.area ?? "",
                    color: white,
                    size: 15,
                    maxLine: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        actionsPadding: EdgeInsets.symmetric(horizontal: 10),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.deepPurple.shade400,
            ),
            child: Icon(
              Icons.notifications,
              color: white,
              size: 22,
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: fullWidth(context),
                height: fullHeight(context) / 2,
                alignment: Alignment.topCenter,
                child: Container(
                  width: fullWidth(context),
                  height: fullHeight(context) / 4,
                  color: deepPurple,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  // height: fullHseight(context) / 2.5,
                  width: fullWidth(context) / 1.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: deepPurple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: white,
                              backgroundImage: NetworkImage(
                                userController
                                        .currentUser.value?.profilePicUrl ??
                                    "",
                              ),
                            ),
                            const Gap(5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  barlowBold(
                                      text: userController
                                              .currentUser.value?.name ??
                                          "",
                                      color: white,
                                      size: 15,
                                      maxLine: 1),
                                  const Gap(2),
                                  barlowRegular(
                                    text: userController
                                            .currentUser.value?.designation ??
                                        "",
                                    color: white,
                                    size: 15,
                                    maxLine: 1,
                                  ),
                                ],
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              color: white,
                              size: 22,
                            )
                          ],
                        ),
                      ),
                      const Gap(5),
                      Divider(
                        color: deepPurple,
                      ),
                      const Gap(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          barlowBold(
                            text:
                                DateFormat('hh:mm:ss a').format(DateTime.now()),
                            color: black,
                            size: 20,
                            letterSpacing: 3,
                            maxLine: 1,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: deepPurple,
                                minimumSize: Size(fullWidth(context) / 3, 40)),
                            onPressed: () {},
                            child: barlowBold(
                              text: "Check In",
                              color: white,
                              size: 15,
                              maxLine: 1,
                            ),
                          )
                        ],
                      ),
                      const Gap(10),
                      Divider(
                        color: deepPurple,
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: deepPurple,
                                  size: 30,
                                ),
                                barlowBold(
                                  text: "06:15 PM",
                                  color: black,
                                  size: 15,
                                  maxLine: 1,
                                ),
                                const Gap(2),
                                barlowRegular(
                                  text: "Check In",
                                  color: black,
                                  size: 12,
                                  maxLine: 1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: deepPurple,
                                  size: 30,
                                ),
                                barlowBold(
                                  text: "06:15 PM",
                                  color: black,
                                  size: 15,
                                  maxLine: 1,
                                ),
                                const Gap(2),
                                barlowRegular(
                                  text: "Check Out",
                                  color: black,
                                  size: 12,
                                  maxLine: 1,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.alarm,
                                  color: deepPurple,
                                  size: 30,
                                ),
                                barlowBold(
                                  text: "06:15 PM",
                                  color: black,
                                  size: 15,
                                  maxLine: 1,
                                ),
                                const Gap(2),
                                barlowRegular(
                                  text: "Working Hr's",
                                  color: black,
                                  size: 12,
                                  maxLine: 1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          const Gap(20),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: green.withOpacity(.2),
                    border: BoxBorder.fromLTRB(
                      top: BorderSide(
                        color: green,
                        width: 5,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          barlowBold(
                            text: "Present",
                            color: black,
                            size: 15,
                            maxLine: 1,
                          ),
                          SizedBox()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          barlowBold(
                            text: "13",
                            color: green,
                            size: 20,
                            maxLine: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: red.withOpacity(.2),
                    border: BoxBorder.fromLTRB(
                      top: BorderSide(
                        color: red,
                        width: 5,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          barlowBold(
                            text: "Absents",
                            color: black,
                            size: 15,
                            maxLine: 1,
                          ),
                          SizedBox()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          barlowBold(
                            text: "05",
                            color: red,
                            size: 20,
                            maxLine: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: yellow.withOpacity(.2),
                    border: BoxBorder.fromLTRB(
                      top: BorderSide(
                        color: yellow,
                        width: 5,
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          barlowBold(
                            text: "Late In",
                            color: black,
                            size: 15,
                            maxLine: 1,
                          ),
                          SizedBox()
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(),
                          barlowBold(
                            text: "07",
                            color: yellow,
                            size: 20,
                            maxLine: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
