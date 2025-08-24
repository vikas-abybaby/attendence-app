import 'dart:math';

import 'package:flutter/material.dart';
import 'package:attandenceadmin/const/color_const.dart';
import 'package:intl/intl.dart';

///Vertical Space
Widget heightSpace(double h) {
  return SizedBox(height: h);
}

///Horizontal Space
Widget widthSpace(double w) {
  return SizedBox(width: w);
}

/// Screen size
double fullWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double fullHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

///Barlow-Regular
Widget barlowRegular({
  String text = "",
  double size = 10,
  TextOverflow? overflow,
  Color? color,
  int? maxLine,
  TextAlign? textAlign,
}) {
  return Text(
    text,
    maxLines: maxLine,
    textAlign: textAlign,
    style: TextStyle(
      overflow: overflow,
      color: color,
      fontSize: size,
      fontFamily: "Barlow",
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
  );
}

/// text style
Widget barlowBold(
    {String text = "",
    double size = 10,
    Color? color,
    int? maxLine,
    TextAlign? textAlign,
    TextOverflow? overflow,
    double? letterSpacing}) {
  return Text(
    text,
    overflow: overflow ?? TextOverflow.ellipsis,
    maxLines: maxLine ?? 5,
    textAlign: textAlign,
    style: TextStyle(
      color: color ?? black.withOpacity(0.8),
      fontSize: size,
      fontFamily: "Barlow",
      letterSpacing: letterSpacing,
      fontWeight: FontWeight.bold,
      fontStyle: FontStyle.normal,
    ),
  );
}

String? formatTimeAmPm(String? time) {
  if (time == null || time.isEmpty) return "N/A";

  try {
    final parsedTime = DateFormat("HH:mm").parse(time);
    return DateFormat('hh:mm a').format(parsedTime);
  } catch (e) {
    return "N/A";
  }
}
String getWorkingHours(String? checkIn, String? checkOut) {
  try {
    if (checkIn == null || checkOut == null || checkIn.isEmpty || checkOut.isEmpty) {
      return "N/A";
    }

    final checkInTime = DateFormat("HH:mm").parse(checkIn);
    final checkOutTime = DateFormat("HH:mm").parse(checkOut);


    final duration = checkOutTime.difference(checkInTime);
    final hours = duration.inHours;
    final minutes = duration.inMinutes % 60;

    return "${hours}h ${minutes}m";
  } catch (e) {
    return "Invalid";
  }
}
Color getRandomColor() {
  final Random random = Random();
  return Color.fromARGB(
    255, // opacity (255 = fully visible)
    random.nextInt(256), // red 0–255
    random.nextInt(256), // green 0–255
    random.nextInt(256), // blue 0–255
  );
}