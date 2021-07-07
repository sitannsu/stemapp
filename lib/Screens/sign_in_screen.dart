import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stemapp/Screens/home_screen.dart';
import 'package:stemapp/Screens/signup.dart';

import 'package:stemapp/core/constants/ColorCode.dart';
import 'package:stemapp/datasource/remote/remote_datasource.dart';

import 'package:stemapp/utils/constants.dart';
import 'package:stemapp/utils/size_config.dart';
import 'package:stemapp/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController textEditingController = new TextEditingController();

  TextEditingController numController = new TextEditingController();
  TextEditingController otpController = new TextEditingController();

  @override
  void dispose() {
    super.dispose();
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  var otpToken;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 280,
                  child: new Image.asset(
                    'assets/images/icon.png',
                  ),
                ),
                Text("Welcome",
                    textAlign: TextAlign.left,
                    style: Utils.getTitleStyle().copyWith(
                      color: Color(ColorCode.BTN_COLOUR),
                      fontSize: 36,
                    )),
                SizedBox(
                  height: 4,
                ),
                Text("To the world of Gappu and Bobo",
                    style: Utils.getLabelSmallStyle()),
                SizedBox(height: 16),
                Text("Enter your registered mobile number to login",
                    style: Utils.getLabelSmallStyle()),
                rectanglebox(),
                Text("Enter the security pin",
                    style: Utils.getLabelSmallStyle()),
                SizedBox(
                  height: 20,
                ),

                Container(
                  height: 60,
                  // width: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            materialWrap(),
                            //SizedBox(width: 4),
                            materialWrap(),
                            //SizedBox(width: 4),
                            materialWrap(),
                            materialWrap(),
                            //  materialWrap(),
                            // materialWrap(),
                          ],
                        ),
                      ),
                      otpwidget(),
                    ],
                  ),
                ),
                //OtpForm(),
                SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        //Text("Forgot Pin?",style:Utils.getLabelSmallStyle().copyWith(color: Colors.red)),
                        Text(
                          "Forgot Pin?",
                          style: Utils.getLabelSmallStyle()
                              .copyWith(color: Colors.red),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Signup()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text("Signup",
                                style: Utils.getTitleStyle()
                                    .copyWith(color: Colors.grey)),
                          ),
                        ),
                      ],
                    ),
                    loginbtn(),
                  ],
                ),

                SizedBox(
                  height: 12,
                ),
                Center(
                  child: Text(
                    '❤ ️A lifelab Product',
                    style: Utils.getLabelSmallStyle().copyWith(fontSize: 11),
                    maxLines: 1,
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget otpwidget() {
    return Container(
      // height:,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
        controller: otpController,
        cursorHeight: 0,
        cursorWidth: 0,

        // autofocus: true,
        obscureText: true,
        style: TextStyle(
          fontSize: 20,
          letterSpacing: 50,
        ),
        maxLength: 4,
        keyboardType: TextInputType.number,
        // textAlign: TextAlign.center,

        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ],
        decoration: InputDecoration(
          // hintText: "855",
          //   hintStyle: TextStyle(
          //     decorationStyle: TextDecorationStyle.solid,
          //     letterSpacing: 100,
          //   ),
          border: InputBorder.none,
        ),

        // onChanged: (value) {
        //   nextField(value, pin2FocusNode);
        // },
      ),
    );
  }

  Widget loginbtn() {
    return GestureDetector(
      onTap: () {
        otpController.text = "123456";
        if (numController.text.isEmpty && otpController.text.isEmpty) {
          print("empty");
          //FlutterToastr.center
          Flushbar(
            flushbarPosition: FlushbarPosition.TOP,
            title: 'Hey ',
            message: ' Please enter required fields',
            duration: Duration(seconds: 3),
          ).show(context);
        } else {
          RemoteDatasource()
              .userLoginWithMObOtp(
                  otpToken: otpToken,
                  mobNo: int.parse(numController.text),
                 // mobNo: phonec),
                  otp: 123456)
              .then((value) async {
            if (value["status"] == 403) {
              return Flushbar(
                flushbarPosition: FlushbarPosition.TOP,
                title: 'Hey ',
                message: ' Please enter a Valid OTP',
                duration: Duration(seconds: 3),
              ).show(context);
            }
            if (value["status"] == 200) {
              print('status 200');
              print(value["results"]['city']);
              var uid = value["results"]['id'];
              var token = value["results"]['login_token'];
              print(uid);
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt(Constants.USER_ID,value["results"]['id']);
              await prefs.setString(Constants.LOGIN_TOKEN,value["results"]['login_token']);
              // prefs.put(Constants.USER_ID);
              //SharedPrefs.saveValue(key: Constants.USER_ID, value: value["results"]['id']);
              //SharedPrefs.saveValue(key: Constants.LOGIN_TOKEN, value: token);
              // SharedPrefs.saveUserID(uid);
              // SharedPrefs.saveToken(token);
              return Flushbar(
                flushbarPosition: FlushbarPosition.TOP,
                title: 'Hey',
                message: "OTP Verified Successfully.",
                duration: Duration(seconds: 2),
              ).show(context).then((values) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              });
            } else {
              return Flushbar(
                flushbarPosition: FlushbarPosition.TOP,
                title: 'Hey ',
                message: "Something went wrong.",
                duration: Duration(seconds: 3),
              ).show(context);
            }
          });
        }

        //Utils.routeTransitionStateFullWithReplace(context, SignInScreen());
        // Utils.routeTransitionStateFullPush(context, SignInScreen());
      },
      child: Container(
        width: 101,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          // icon: Icons.arrow_forward_ios,
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
                offset: Offset(0, 5),
                blurRadius: 5)
          ],
          color: Color(ColorCode.BTN_COLOUR),
        ),
        child: Center(
          child:
              //Text("Enter",style:Utils.getHeaderWhiteStyle())
              Directionality(
                  textDirection: TextDirection.rtl,
                  child: TextButton.icon(
                    onPressed: null,
                    label: Text(
                      "Login",
                      style: Utils.getHeaderWhiteStyle(),
                      textAlign: TextAlign.center,
                    ),
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 18,
                    ),
                  )),
        ),
      ),
    );
  }

  Widget rectanglebox() {
    return new Container(
      alignment: Alignment.center,
      //width: 341,
      height: 50,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow: [
          BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
              offset: Offset(0, 5),
              blurRadius: 10)
        ],
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
      child: new TextFormField(
        // textAlign: TextAlign.center,
        textAlignVertical: TextAlignVertical.bottom,
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your number",
          //prefixIcon:Icon(Icons.phone_android_rounded),
          // contentPadding: EdgeInsets.only(top: 80, left: 30),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 20), // add padding to adjust icon
            child: Icon(Icons.phone_android),
          ),

          contentPadding:
              EdgeInsets.only(left: 35, bottom: -5, top: 0, right: 15),
        ),

        controller: numController,
        maxLength: 10,
        onChanged: (val) {
          if (val.length == 10) {
            RemoteDatasource()
                .userLoginWithMob(mobNo: int.parse(val))
                .then((value) {
              if (value["status"] == 403) {
                print("Please signup.");
                return Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: 'Hey ',
                  message: 'Please signup.',
                  duration: Duration(seconds: 3),
                ).show(context);
                // return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: const Text('No such user found'),
                //   duration: const Duration(seconds: 1),
                // ));
              } else if (value["status"] == 200) {
                otpToken = value["otp_verify_token"];
                print("successfull$otpToken");
                return Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: 'Hey ',
                  message: 'successful',
                  duration: Duration(seconds: 3),
                ).show(context);

                // return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: const Text('successfull'),
                //   duration: const Duration(seconds: 1),
                // ));
              } else {
                print("something went wrong");
                return Flushbar(
                  flushbarPosition: FlushbarPosition.TOP,
                  title: 'Hey ',
                  message: 'Something went wrong',
                  duration: Duration(seconds: 3),
                ).show(context);
                // return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                //   content: const Text('Something went wrong'),
                //   duration: const Duration(seconds: 1),
                //   behavior: SnackBarBehavior.floating,
                //   padding: EdgeInsets.only(bottom: 500),
                // ));
              }
            });
            print("ho gya");
          }
        },

        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], // Only numbers can be entered
      ),
    );
  }

  materialWrap() {
    return SizedBox(
        width: 45,
        height: 50,
        child: Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 12,
            child: Container(
              height: 45,
              width: 50,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
            )));
  }

  Widget mobilenobox() {
    return new TextField(
      // autovalidateMode: AutovalidateMode.always,
      controller: textEditingController,

      keyboardType: TextInputType.text,
      // cursorColor: Colors.blue[200],
      textInputAction: TextInputAction.done,
      autofocus: true,

      decoration: InputDecoration(
        labelText: "Enter mobile",
        prefixIcon:
            Icon(Icons.phone_android, color: Colors.orange[200], size: 20),
        hintText: "mobile",
        border: OutlineInputBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
              bottomLeft: Radius.circular(24),
              bottomRight: Radius.circular(24),
            ),
            borderSide: BorderSide.none),
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            borderSide: BorderSide(color: Colors.red)),
      ),
    );
  }

  final otpInputDecoration = InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 16),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: BorderSide(color: Color(ColorCode.GREY_LIGHT_COLOR)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
      borderSide: BorderSide(color: Color(ColorCode.GREY_LIGHT_COLOR)),
    ),
  );

  final boxdecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.0111),
          offset: Offset(0, 2),
          blurRadius: 5)
    ],
    color: Color.fromRGBO(255, 255, 255, 10),
  );

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "";
  }
}
