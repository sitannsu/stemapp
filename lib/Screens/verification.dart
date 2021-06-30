import 'package:flutter/material.dart';
import 'package:stemapp/Screens/profileupload.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/utils.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: deviceSize.height,
          width: deviceSize.width,
          color: Colors.white60,
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
                            padding: const EdgeInsets.only(left: 24.0,top: 30.0),
                            child: Text(
                              "Verification!",
                              style: Utils.getHeaderPrimaryStyle()
                                  .copyWith(fontSize: 36,fontWeight: FontWeight.bold,letterSpacing: 0.9),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 18.0,right: 10),
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
                          'assets/images/verify.png',

                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
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
                                borderRadius: BorderRadius.circular(15)),
                          )),
                    )),
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
                  signupbtn()
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
                  Row(
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
                  Row(
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
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 40.0, top: 30),
                child: signupbtn(),
              )
            ],
          ),
        ),
        //Body(),
      ),
    );
  }


  Widget signupbtn() {
    return GestureDetector(
      onTap: () {
        //Utils.routeTransitionStateFullWithReplace(context, welcomescreen());
        Utils.routeTransitionStateFullPush(context, Profileupload());
      },
      child: Align(
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
      ),
    );
  }
}
