import 'package:shared_preferences/shared_preferences.dart';
import 'package:stemapp/utils/constants.dart';

class SharedPrefs {
// // Retrieve Value

  static Future<String?> getKeyvalue({String? key}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.reload();
    var pref = prefs.getString(key!);
    print("key$pref");
    return pref;
  }

//  Store Data
  static saveValue({String? key, var value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userToken", value);
  }

  static saveUserID(id, {String? key, var value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print('uid is $id');
    await prefs.setString(Constants.USER_ID, id.toString());
  }

  static getUserID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.getString(Constants.USER_ID);
  }
  static saveToken(var value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(Constants.LOGIN_TOKEN, value);
  }

  static getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.getString(Constants.LOGIN_TOKEN);
  }
}
