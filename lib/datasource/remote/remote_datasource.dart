import 'dart:io';

import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stemapp/core/error/exceptions.dart';
import 'package:stemapp/datasource/local/shared_prefs.dart';
import 'package:stemapp/model/MyProfileData.dart';
import 'package:stemapp/utils/constants.dart';

class RemoteDatasource {
  Dio dio = Dio();
  static const baseUrl = "http://13.234.240.112/";
  var token = "Gappu-NsVjeTwJ21MDhkItL";

  Future<dynamic> userSignUp(
      {String? studentName,
      String? dateOfbirth,
      String? phoneNumber,
      String? gender,
      String? grade,
      String? schoolName,
      String? address,
      String? state,
      String? city,
      String? deviceId}) async {
    print("inside signup");
    try {
      print("start");

      Response response = await dio.post(baseUrl + Constants.SIGN_UP,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token},
          ),
          data: {
            "student_name": studentName,
            "date_of_birth": dateOfbirth,
            "phone_number": phoneNumber,
            "gender": gender,
            "grade": grade,
            "school_name": schoolName,
            "address": address,
            "state": state,
            "city": city,
            "device_id": deviceId
          });

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);
      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> userLoginWithMob({int? mobNo}) async {
    try {
      Response response = await dio.post(baseUrl + Constants.LOGIN_OTP,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token},
          ),
          data: {"phone_number": mobNo});

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);
      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<MyProfileData> profileData() async {
    try {
      // var loginToken = SharedPrefs.getKeyvalue(
      //   key: Constants.LOGIN_TOKEN,
      // );
      // var uId = SharedPrefs.getKeyvalue(
      //   key: Constants.USER_ID,
      // );
      SharedPreferences prefs = await SharedPreferences.getInstance();
      // print(baseUrl + Constants.MY_PROFILE);
      // print('toekn');
      // SharedPreferences prefs = await SharedPreferences.getInstance();
      // print(SharedPrefs.getToken());
      // print("uId");
      // print(SharedPrefs.getUserID());
      // print('end');
      Response response = await dio.post(baseUrl + Constants.MY_PROFILE,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token, 'Login-Token':prefs.getString(Constants.LOGIN_TOKEN)},
          ),
          data: {"user_id":prefs.getInt(Constants.USER_ID)});

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");

      return MyProfileData.fromJson(response.data);
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> userLoginWithMObOtp(
      {int? mobNo, int? otp, String? otpToken}) async {
    var url = "$baseUrl/login_by_mobile_otp_verify";
    var token = "Gappu-NsVjeTwJ21MDhkItL";

    print("inside signup");
    try {
      print("start");

      Response response = await dio.post(url,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token},
          ),
          data: {
            "phone_number": mobNo,
            "otp_verify_token": otpToken,
            "otp": otp
            // "phone_number": 9003315980,
            // "otp_verify_token": "4a2c55ef5c40f09",
            // "otp": 123456
          });
      print("url$url");

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);


      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }
  Future uploadProfile() async{
    //var  response = await dio.post("/info", data: formData);

    // FormData formData = new FormData.fromMap({
    //   "iamge":

    // });
  }

  Future<dynamic> userMPinSet({String? mPin}) async {
    var url = "$baseUrl/user_security_pin_set";
    var token = "Gappu-NsVjeTwJ21MDhkItL";

    print("inside signup");
    try {
      print("start");
      // userId

      var userId = SharedPrefs.getKeyvalue(key: "userId");

      Response response = await dio.post(url,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token, 'Login-Token': '676f09eaa4f830d'},
          ),
          data: {
            "user_id": 27,
            "security_pin": mPin,
          });
      print("url$url");

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);
      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> mobOtp() async {
    var url = "$baseUrl/mobile_otp";
    var token = "Gappu-NsVjeTwJ21MDhkItL";

    var userMobNo = SharedPrefs.getKeyvalue(key: "userMobNo");

    print("inside mobOtp");
    try {
      print("start");
      print(userMobNo);

      Response response = await dio.post(url,
          options: Options(
            contentType: 'application/json',
            headers: {
              'Auth-Token': token,
            },
          ),
          data: {"phone_number": int.parse(userMobNo.toString())});
      print("url$url");

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);
      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> mPinSet() async {
    var url = "$baseUrl/user_security_pin_set";
    var token = "Gappu-NsVjeTwJ21MDhkItL";

    var userMobNo = SharedPrefs.getKeyvalue(key: "userMobNo");
    // var userMobNo = SharedPrefs.getKeyvalue(key: "userMobNo");

    print("inside signup");
    try {
      print("start");

      Response response = await dio.post(url,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token, 'Login-Token': '676f09eaa4f830d'},
          ),
          data: {
            "user_id": 27,
            "security_pin": "5555",
          });
      print("url$url");

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);
      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> userProfilePhotoUpdate({PickedFile? imgFile}) async {
    var url = "$baseUrl/user_security_pin_set";
    var token = "Gappu-NsVjeTwJ21MDhkItL";
    // PickedFile? imgFile;

    String fileName = imgFile!.path.split('/').last;

    print("inside signup");
    try {
      print("start");
      // userId

      var userId = SharedPrefs.getKeyvalue(key: "userId");

      Response response = await dio.post(url,
          options: Options(
            contentType: 'application/json',
            headers: {'Auth-Token': token, 'Login-Token': '676f09eaa4f830d'},
          ),
          data: new FormData.fromMap({
            "user_id": 27,
            "file_name":
                await MultipartFile.fromFile(imgFile.path, filename: fileName),
          }));
      print("url$url");

      // var datadecode = jsonDecode(response.data);
      print("data${response.data}");
      // final dataListEntity =
      // = NewsByCategoryModel.fromJson(datadecode);
      return response.data;
    } on DioError catch (dioError) {
      throw CustomException.fromDioError(dioError);
    } on SocketException catch (e) {
      throw Exception(e);
    }
  }
}
