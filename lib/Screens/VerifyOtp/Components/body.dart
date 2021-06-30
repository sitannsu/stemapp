import 'package:flutter/material.dart';
import 'package:stemapp/utils/ColorCode.dart';

import 'background.dart';
import 'package:pinput/pin_put/pin_put.dart';

class Body extends StatefulWidget {



  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  Animation<double>? animation;
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();
  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    print("canMoveToDashboardcanMoveToDashboard");

    var amountAdded = 0;

    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(

          children: <Widget>[
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Verification",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color:Color(ColorCode.PRIMARY_COLOR)),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      width: 200,
                      child: Text(
                        "Please enter the 4 digit OTP you recieved on your mobile number",

                      ),
                    ),
                  ],
                ),
                new Image.asset(
                  'assets/images/verify_otp_icon.png',

                ),
              ],
            ),

            Container(

              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              child: PinPut(
                fieldsCount: 4,

                focusNode: _pinPutFocusNode,


                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(5.0),
                  border: Border.all(
                    color: Colors.deepPurpleAccent.withOpacity(.5),
                  ),
                ),
              ),
            ),
            SizedBox(height: size.height * 0.05),





          ],
        ),
      ),
    );
  }
}

