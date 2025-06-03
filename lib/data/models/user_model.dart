class UsersModel {
  String? userId;
  String? name;
  String? email;
  String? password;
  String? dob;
  int? age;
  String? gender;
  String? role;
  String? phone;
  String? address;
  bool? isActive;
  String? lastLogin;
  String? fcmToken;
  String? platform;
  String? profilePicUrl;
  String? department;
  String? employeeId;
  String? createdBy;
  String? reportingTo;
  String? createdAt;
  String? updatedAt;

  UsersModel({
    this.userId,
    this.name,
    this.email,
    this.password,
    this.dob,
    this.age,
    this.gender,
    this.role,
    this.phone,
    this.address,
    this.isActive,
    this.lastLogin,
    this.fcmToken,
    this.platform,
    this.profilePicUrl,
    this.department,
    this.employeeId,
    this.createdBy,
    this.reportingTo,
    this.createdAt,
    this.updatedAt,
  });

  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['_id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    dob = json['dob'];
    age = json['age'];
    gender = json['gender'];
    role = json['role'];
    phone = json['phone'];
    address = json['address'];
    isActive = json['isActive'];
    lastLogin = json['lastLogin'];
    fcmToken = json['fcmToken'];
    platform = json['platform'];
    profilePicUrl = json['profilePicUrl'];
    department = json['department'];
    employeeId = json['employeeId'];
    createdBy = json['createdBy'];
    reportingTo = json['reportingTo'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = userId;
    data['name'] = name;
    data['email'] = email;
    data['password'] = password;
    data['dob'] = dob;
    data['age'] = age;
    data['gender'] = gender;
    data['role'] = role;
    data['phone'] = phone;
    data['address'] = address;
    data['isActive'] = isActive;
    data['lastLogin'] = lastLogin;
    data['fcmToken'] = fcmToken;
    data['platform'] = platform;
    data['profilePicUrl'] = profilePicUrl;
    data['department'] = department;
    data['employeeId'] = employeeId;
    data['createdBy'] = createdBy;
    data['reportingTo'] = reportingTo;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
