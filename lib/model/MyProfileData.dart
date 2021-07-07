class MyProfileData {
  int? status;
  String? message;
  Results? results;

  MyProfileData({this.status, this.message, this.results});

  MyProfileData.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    results =
    json['results'] != null ? new Results.fromJson(json['results']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.results != null) {
      data['results'] = this.results!.toJson();
    }
    return data;
  }
}

class Results {
  String? city;
  String? emailId;
  String? fatherName;
  String? phoneNumber;
  String? school;
  String? state;
  String? studentName;
  Null? updateTime;
  String? dateOfBirth;
  String? grade;
  int? id;
  String? loginToken;
  String? address;
  String? gender;
  String? deviceId;
  String? status;
  String? securityPin;
  String? profilePic;
  int? activitiesCompleted;
  int? postReact;
  int? goldCoin;
  int? greenCoin;
  int? knowledgePoint;
  int? hearts;

  Results(
      {this.city,
        this.emailId,
        this.fatherName,
        this.phoneNumber,
        this.school,
        this.state,
        this.studentName,
        this.updateTime,
        this.dateOfBirth,
        this.grade,
        this.id,
        this.loginToken,
        this.address,
        this.gender,
        this.deviceId,
        this.status,
        this.securityPin,
        this.profilePic,
        this.activitiesCompleted,
        this.postReact,
        this.goldCoin,
        this.greenCoin,
        this.knowledgePoint,
        this.hearts});

  Results.fromJson(Map<String?, dynamic> json) {
    city = json['city'];
    emailId = json['email_id'];
    fatherName = json['father_name'];
    phoneNumber = json['phone_number'];
    school = json['school'];
    state = json['state'];
    studentName = json['student_name'];
    updateTime = json['update_time'];
    dateOfBirth = json['date_of_birth'];
    grade = json['grade'];
    id = json['id'];
    loginToken = json['login_token'];
    address = json['address'];
    gender = json['gender'];
    deviceId = json['device_id'];
    status = json['status'];
    securityPin = json['security_pin'];
    profilePic = json['profile_pic'];
    activitiesCompleted = json['activities_completed'];
    postReact = json['post_react'];
    goldCoin = json['gold_coin'];
    greenCoin = json['green_coin'];
    knowledgePoint = json['knowledge_point'];
    hearts = json['hearts'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['email_id'] = this.emailId;
    data['father_name'] = this.fatherName;
    data['phone_number'] = this.phoneNumber;
    data['school'] = this.school;
    data['state'] = this.state;
    data['student_name'] = this.studentName;
    data['update_time'] = this.updateTime;
    data['date_of_birth'] = this.dateOfBirth;
    data['grade'] = this.grade;
    data['id'] = this.id;
    data['login_token'] = this.loginToken;
    data['address'] = this.address;
    data['gender'] = this.gender;
    data['device_id'] = this.deviceId;
    data['status'] = this.status;
    data['security_pin'] = this.securityPin;
    data['profile_pic'] = this.profilePic;
    data['activities_completed'] = this.activitiesCompleted;
    data['post_react'] = this.postReact;
    data['gold_coin'] = this.goldCoin;
    data['green_coin'] = this.greenCoin;
    data['knowledge_point'] = this.knowledgePoint;
    data['hearts'] = this.hearts;
    return data;
  }
}