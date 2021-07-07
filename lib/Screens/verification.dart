import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stemapp/Screens/upload_prof_img_screen.dart';
import 'package:stemapp/core/constants/ColorCode.dart';
import 'package:stemapp/datasource/local/shared_prefs.dart';
import 'package:stemapp/datasource/remote/remote_datasource.dart';
import 'package:stemapp/utils/constants.dart';
import 'package:stemapp/utils/utils.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  TextEditingController otpController = new TextEditingController();
  TextEditingController confotpController1 = new TextEditingController();
  TextEditingController confotpController2 = new TextEditingController();
  String otpToken="";

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    RemoteDatasource().mobOtp().then((value) {
      otpToken = value["otp_verify_token"];

      // SharedPrefs.saveValue(
      //     key: "otpToken", value: value["otp_verify_token"]);
    });
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          color: Colors.white60,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 170,
                  // color: Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 24.0, top: 30.0),
                              child: Text(
                                "Verification!",
                                style: Utils.getHeaderPrimaryStyle().copyWith(
                                    fontSize: 36,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 0.9),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 18.0, right: 10),
                              child: Text(
                                "Please enter your 4 digit OTP you received on your mobile number",
                                style: TextStyle(
                                  fontFamily: 'OpenSans-Regular',
                                  fontSize: 14.0,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w500,
                                  // letterSpacing: 0.16,
                                ),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 170,
                          child: Image.asset(
                            'assets/images/icon.png',
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // otpwidget(),
                Container(
                  height: 60,
                  // width: 400,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20.0, bottom: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // materialWrap(),
                            // materialWrap(),
                            materialWrap(),
                            materialWrap(),
                            materialWrap(),
                            materialWrap(),
                          ],
                        ),
                      ),
                      otpwidget(
                          controller: otpController,
                          onChanged: (val) {
                            if (val.length == 4) {}
                          }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "00:12",
                            style: TextStyle(
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 14.0,
                              color: Colors.black38,
                              fontWeight: FontWeight.w500,
                              // letterSpacing: 0.16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "Resend OTP",
                            style: TextStyle(
                              fontFamily: 'OpenSans-Regular',
                              fontSize: 16.0,
                              color: Colors.red,
                              fontWeight: FontWeight.w400,
                              // letterSpacing: 0.16,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () async {
                          SharedPreferences prefs = await SharedPreferences.getInstance();

                          var userMobNo = prefs.getString(Constants.USER_MOBILE);
                              //SharedPrefs.getKeyvalue(key: "userMobNo");
                          RemoteDatasource()
                              .userLoginWithMObOtp(
                           // mobNo: int.parse(userMobNo.toString()),
                            mobNo: int.parse(userMobNo!),
                           // mobNo: widget.mobile,
                            otp: 123456,
                            otpToken: otpToken,
                          )
                              .then((value) {
                            if (value["status"] == 403) {
                              return Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                title: 'Hey ',
                                message: ' No such user found',
                                duration: Duration(seconds: 3),
                              ).show(context);
                            }
                            if (value["status"] == 200) {
                              print('status 200');
                              print(value["results"]['city']);
                              var uid = value["results"]['id'];
                              var token = value["results"]['login_token'];
                              print(uid);
                              SharedPrefs.saveValue(
                                  key: Constants.USER_ID, value: uid);
                              SharedPrefs.saveValue(
                                  key: Constants.LOGIN_TOKEN, value: token);
                              // SharedPrefs.saveUserID(uid);
                              // SharedPrefs.saveToken(token);
                              return Flushbar(
                                flushbarPosition: FlushbarPosition.TOP,
                                title: 'Hey',
                                message: "OTP has been sent successfully.",
                                duration: Duration(seconds: 3),
                              ).show(context).then((values) {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => HomeScreen()));
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
                        },
                        child: otpbtn())
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Set a 4 digit pin to login",
                        style: TextStyle(
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 15.0,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          // letterSpacing: 0.16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    /*   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          4,
                              (index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(15),
                                elevation: 12,
                                child: Container(
                                  height: 40,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                )),
                          )),
                    ),*/
                    // otpwidget1(),
                    Container(
                      height: 60,
                      // width: 400,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // materialWrap(),
                                // materialWrap(),
                                materialWrap(),
                                materialWrap(),
                                materialWrap(),
                                materialWrap(),
                              ],
                            ),
                          ),
                          otpwidget(
                              controller: confotpController1,
                              onChanged: (val) {
                                print(val);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 25.0),
                      child: Text(
                        "Confirm the 4 digit pin to login",
                        style: TextStyle(
                          fontFamily: 'OpenSans-Regular',
                          fontSize: 15.0,
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          // letterSpacing: 0.16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    /* Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          4,
                              (index) => Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Material(
                                borderRadius: BorderRadius.circular(15),
                                elevation: 12,
                                child: Container(
                                  height: 40,
                                  width: 50,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(15)),
                                )),
                          )),
                    ),*/
                    Container(
                      height: 60,
                      // width: 400,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.only(right: 20.0, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // materialWrap(),
                                // materialWrap(),
                                materialWrap(),
                                materialWrap(),
                                materialWrap(),
                                materialWrap(),
                              ],
                            ),
                          ),
                          otpwidget(
                              controller: confotpController2,
                              onChanged: (val) {
                                print(val);
                              }),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 40.0, top: 30),
                  child: InkWell(
                      onTap: () async {
                        if (confotpController2.text.isNotEmpty &&
                            confotpController1.text.isNotEmpty) {
                          if (confotpController1.text ==
                              confotpController2.text) {
                            RemoteDatasource()
                                .userMPinSet(
                              mPin: "5555",
                              // confotpController1.text
                            )
                                .then((value) {
                              setState(() {});
                              if (value["status"] == 401) {
                                isLoading = false;
                                return Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: 'Hey ',
                                  message:
                                      ' User details not found / Invalid login token.',
                                  duration: Duration(seconds: 3),
                                ).show(context);
                              }
                              if (value["status"] == 200) {
                                isLoading = true;

                                return Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: 'Hey ',
                                  message: "MPIN Set Successfully.",
                                  duration: Duration(seconds: 3),
                                ).show(context).then((value) {
                                  isLoading = false;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => UploadProfImgScreen()));
                                });
                              } else {
                                isLoading = false;
                                return Flushbar(
                                  flushbarPosition: FlushbarPosition.TOP,
                                  title: 'Hey ',
                                  message: "Something went wrong.",
                                  duration: Duration(seconds: 3),
                                ).show(context);
                              }
                            });
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: const Text(
                                  'confirm password should be match'),
                              duration: const Duration(seconds: 1),
                            ));
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text('please fill required fields'),
                            duration: const Duration(seconds: 1),
                          ));
                        }
                      },
                      child: isLoading
                          ? customLoginLoader(text: "Please wait")
                          : signupbtn()),
                )
              ],
            ),
          ),
        ),
        //Body(),
      ),
    );
  }

  Widget otpwidget({controller, Function(String)? onChanged}) {
    return Container(
      // height:,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.bottomCenter,
      child: TextFormField(
          controller: controller,
          cursorHeight: 0,
          cursorWidth: 0,

          // autofocus: true,
          obscureText: true,
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 85,
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
          onChanged: onChanged),
    );
  }

  materialWrap({Widget? widget}) {
    return SizedBox(
        width: 60,
        child: Material(
            borderRadius: BorderRadius.circular(15),
            elevation: 12,
            child: Container(
              height: 50,
              width: 60,
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: widget,
            )));
  }

  // void nextField(String value, FocusNode focusNode) {
  //   if (value.length == 1) {
  //     focusNode.requestFocus();
  //   }
  // }

  final boxdecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    boxShadow: [
      BoxShadow(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          offset: Offset(0, 3),
          blurRadius: 10)
    ],
    color: Color.fromRGBO(255, 255, 255, 1),
  );

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
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Color(ColorCode.UNSELECT_COLOUR)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: Color(ColorCode.UNSELECT_COLOUR)),
    ),
  );
  Widget signupbtn() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        height: 35,
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
                      "Next",
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


  Widget otpbtn() {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        width: 100,
        height: 35,
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
                  "Next",
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
  customLoginLoader({
    String? text,
  }) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        height: 45,
        width: 130,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.amber.shade700),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text!,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "Noway",
                    fontWeight: FontWeight.bold),
              ),
              Container(
                height: 15,
                width: 15,
                margin: EdgeInsets.all(5),
                child: CircularProgressIndicator(
                  strokeWidth: 3.0,
                  valueColor: AlwaysStoppedAnimation(Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
