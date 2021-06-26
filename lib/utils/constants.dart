import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stemapp/utils/size_config.dart';

const kPrimaryColor = Color(0xFFFF7643);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Color(0xFF757575);

const kAnimationDuration = Duration(milliseconds: 200);
class Constants {
  Color primaryColor = Colors.indigo.shade500;



  //static const BASE_URL = "http://digitalvtx.com/gotham/apimodule/";
  //static const BASE_URL = "http://103.112.26.101/agency/api/";
 static const BASE_URL = "http://192.168.1.147/agency/api/";
  static const IMAGE_BASE_URL_UPLOAD = "http://digitalvtx.com/gotham/storage/uploads/";
  static const PRODUCT_lIST = "userproducts/?id=1";
  static const PRODUCT_DETAILS = "productdetails";
  static const REGISTER = "register";
  static const POST_PRODUCT_URL = "postItemRequirment";

  static const POST_LIST_URL = "postmyItemlist";
  static const LOGIN = "userLogin";
  static const PROCESS_ORDER = "adminApproveItemRequest";
  static const PAST_ORDER = "orderhistory";
  static const UPCOMING_ORDER = "orderupcominghistory";


  static const String SIGN_IN = 'signin';
  static const String SIGN_UP ='signup';
  static const String SPLASH_SCREEN ='splashscreen';
  static const String POST_SCREEN ='post';
  static const String HOME_SCREEN ='home';
  static const String DRAWER_SCREEN ='drawer';

  static const SINGLE_ORDER = "singleorder";
  static const GET_USER = "getuser";
  static const EDIT_PROFILE = "editprofile";
  static const PLACE_ORDER = "addOrder";
  static const FORGOT_PASSWORD = "forgotpassword";
  static const CHANGE_IMAGE = "paymentprocess";

  final otpInputDecoration = InputDecoration(
    contentPadding:
    EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
    border:OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        borderSide: BorderSide.none),
   // focusedBorder: outlineInputBorder(),
    //enabledBorder: outlineInputBorder(),
  );

  OutlineInputBorder outlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: BorderSide(color: kTextColor),
    );
  }

  void showDialogBlurBg(
      {required BuildContext context, String? msg, required String title, Function? onTap}) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return new BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: new Container(
              width: width,
              height: height,
              child: CupertinoAlertDialog(
                title: Text(
                  title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Quicksand'),
                ),
                content: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Text(
                    msg!,
                    style: TextStyle(
                        fontSize: 14, height: 1.5, fontFamily: 'Quicksand'),
                    textAlign: TextAlign.center,
                  ),
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    child: Text('Done',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Quicksand',
                            fontWeight: FontWeight.bold)),
                    isDefaultAction: true,
                    //onPressed: onTap,
                  ),
                ],
              ),
              color: Colors.white.withOpacity(0.2),
            ),
          );
        });
  }


}
