import 'dart:convert';

class Attendance {
  bool? late;
  bool? checkIn;
  bool? checkOut;
  String? checkOutLocation;
  String? checkOutTime;
  int? id;
  int? userId;
  String? date;
  String? checkInTime;
  String? checkInLocation;
  List<ActivityLatLong>? activityLatLong;
  String? updatedAt;
  String? createdAt;

  Attendance(
      {this.late,
      this.checkIn,
      this.checkOut,
      this.checkOutLocation,
      this.checkOutTime,
      this.id,
      this.userId,
      this.date,
      this.checkInTime,
      this.checkInLocation,
      this.activityLatLong,
      this.updatedAt,
      this.createdAt});

  Attendance.fromJson(Map<String, dynamic> json) {
    late = json['late'];
    checkIn = json['checkIn'];
    checkOut = json['checkOut'];
    checkOutLocation = json['checkOutLocation'];
    checkOutTime = json['checkOutTime'];
    id = json['id'];
    userId = json['userId'];
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
    data['date'] = date;
    data['checkInTime'] = checkInTime;
    data['checkInLocation'] = checkInLocation;
    if (activityLatLong != null) {
      data['activityLatLong'] =
          activityLatLong!.map((v) => v.toJson()).toList();
    }
    data['updatedAt'] = updatedAt;
    data['createdAt'] = createdAt;
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
