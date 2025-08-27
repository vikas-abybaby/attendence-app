
import 'package:attandenceadmin/data/models/room_model.dart';

class Attendance {
  int? id;
  int? userId;
  bool? late;
  bool? checkIn;
  bool? checkOut;
  bool? absent;
  String? checkOutLocation;
  String? absentLocation;
  String? checkOutTime;
  String? absentTime;
  int? monthWithoutLate;
  int? monthLate;
  int? monthAbsent;
  String? date;
  String? checkInTime;
  String? checkInLocation;
  List<ActivityLatLong>? activityLatLong;
  String? updatedAt;
  String? createdAt;
  List<GroupModel>? group;

  Attendance({
    this.late,
    this.checkIn,
    this.checkOut,
    this.checkOutLocation,
    this.checkOutTime,
    this.id,
    this.userId,
    this.absent,
    this.absentLocation,
    this.absentTime,
    this.monthWithoutLate,
    this.monthLate,
    this.monthAbsent,
    this.date,
    this.checkInTime,
    this.checkInLocation,
    this.activityLatLong,
    this.updatedAt,
    this.createdAt,
    this.group,
  });

  Attendance.fromJson(Map<String, dynamic> json) {
    late = json['late'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    checkOutLocation = json['checkOutLocation'];
    checkOutTime = json['checkOutTime'];
    id = json['id'];
    userId = json['userId'];
    monthWithoutLate = json['month_without_late'];
    absent = json['absent'];
    absentTime = json['absentTime'];
    absentLocation = json['absentLocation'];
    monthLate = json['month_late'];
    monthAbsent = json['month_absent'];
    date = json['date'];
    checkInTime = json['checkInTime'];
    checkInLocation = json['checkInLocation'];
    if (json['activityLatLong'] != null) {
      activityLatLong = <ActivityLatLong>[];
      json['activityLatLong'].forEach((v) {
        activityLatLong!.add(ActivityLatLong.fromJson(v));
      });
    }
    updatedAt = json['updatedAt'];
    createdAt = json['createdAt'];
    if (json["group"] is List) {
      group = (json["group"] as List).map((e) => GroupModel.fromJson(e)).toList();
    } else {
      group = [];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['late'] = late;
    data['checkIn'] = checkIn;
    data['checkOut'] = checkOut;
    data['checkOutLocation'] = checkOutLocation;
    data['checkOutTime'] = checkOutTime;
    data['id'] = id;
    data['userId'] = userId;
    data['absent'] = absent;
    data['absentLocation'] = absentLocation;
    data['absentTime'] = absentTime;
    data['month_without_late'] = monthWithoutLate;
    data['month_late'] = monthLate;
    data['month_absent'] = monthAbsent;
    data['date'] = date;
    data['checkInTime'] = checkInTime;
    data['checkInLocation'] = checkInLocation;
    if (activityLatLong != null) {
      data['activityLatLong'] =
          activityLatLong!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;

    if (group != null) {
      data['group'] = group!.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ActivityLatLong {
  String? lat;
  String? long;
  String? time;

  ActivityLatLong({this.lat, this.long, this.time});

  ActivityLatLong.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    long = json['long'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['long'] = long;
    data['time'] = time;
    return data;
  }
}
