import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stemapp/Screens/signup.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/size_config.dart';
import 'package:stemapp/utils/utils.dart';


class welcomescreen extends StatefulWidget {
  @override
  _welcomescreenState createState() => _welcomescreenState();
}

class _welcomescreenState extends State<welcomescreen> {
  TextEditingController textEditingController = new TextEditingController();

  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
  }
  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:
        SingleChildScrollView(
          child:Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [

            Container(
              height:284,

              child: new Image.asset(
                'assets/images/icon.png',
              ),
            ),
            Text("Welcome",textAlign:TextAlign.left,style:Utils.getTitleStyle().copyWith(color: Color(ColorCode.BTN_COLOUR),fontSize: 36,)),
            SizedBox(height: 4,),
            Text("To the world of Gappu and Bobo",style:Utils.getLabelSmallStyle()),
            SizedBox(height: 16),
            Text("Enter your registered mobile number to login",style:Utils.getLabelSmallStyle()),
            rectanglebox(),
            Text("Enter the security pin",style:Utils.getLabelSmallStyle()),
            SizedBox(height: 8),

            otpwidget(),
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
                    GestureDetector(
                      onTap: () {

                      },
                      //=> Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
                      child: Text(
                        "Forgot Pin?",style:Utils.getLabelSmallStyle().copyWith(color: Colors.red),

                      ),
                    ),
                    GestureDetector(
                        onTap: (){
                          Utils.routeTransitionStateFullPush(context, Signup());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text("Signup",style:Utils.getTitleStyle().copyWith(color: Colors.grey,fontSize: 20)),
                        )),
                  ],
                ),
                loginbtn(),

              ],


            ),

SizedBox(height: 12,),
            Center(
              child: Text(
                '❤ ️A lifelab Product',style: Utils.getLabelSmallStyle().copyWith(fontSize: 11),
                maxLines: 1,
              ),
            ),

            ],
        ),
      )),
    );
  }
  Widget otpwidget(){
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
          width: 50,
          height: 50,
          decoration: boxdecoration,
                child: TextFormField(
                  // autofocus: true,
                  obscureText: true,
                  style: TextStyle(fontSize: 28),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                   decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin2FocusNode);
                  },
                ),
              ),

            Container(
              width: 50,
              height: 50,
              decoration: boxdecoration,

              child: TextFormField(
                  focusNode: pin2FocusNode,
                  obscureText: true,
                  style: TextStyle(fontSize: 28),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  decoration: otpInputDecoration,
                  onChanged: (value) {
                    nextField(value, pin3FocusNode);

                  }
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: boxdecoration,
              child: TextFormField(
                focusNode: pin3FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 28),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) => nextField(value, pin4FocusNode),
              ),
            ),
            Container(
              width: 50,
              height: 50,
              decoration: boxdecoration,
              child: TextFormField(
                focusNode: pin4FocusNode,
                obscureText: true,
                style: TextStyle(fontSize: 28),
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: otpInputDecoration,
                onChanged: (value) {
                  if (value.length == 1) {
                    pin4FocusNode.unfocus();
                    // Then you need to check is the code is correct or not
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ]

    );
  }

  Widget loginbtn(){
    return GestureDetector(
      onTap: (){
        //Utils.routeTransitionStateFullWithReplace(context, welcomescreen());
       // Utils.routeTransitionStateFullPush(context, Signup());
      },
      child: Container(
        width: 101,
        height: 40,
        decoration: BoxDecoration(
          borderRadius : BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
          // icon: Icons.arrow_forward_ios,
          boxShadow : [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
              offset: Offset(0,5),
              blurRadius: 5
          )],
          color : Color(ColorCode.BTN_COLOUR),
        ),
        child: Center(child:
        //Text("Enter",style:Utils.getHeaderWhiteStyle())
        Directionality(
            textDirection: TextDirection.rtl,
            child: TextButton.icon(onPressed: null, label: Text("Login",style: Utils.getHeaderWhiteStyle(),textAlign: TextAlign.center,), icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,),)),
        ),

      ),
    );
  }

  Widget rectanglebox(){
    return  new Container(
      //width: 341,
      height: 51,
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius : BorderRadius.only(

          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        boxShadow : [BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.05000000074505806),
            offset: Offset(0,5),
            blurRadius: 10
        )],
        color : Color.fromRGBO(255, 255, 255, 1),
      ),
      child: Center(child:new TextFormField(
        decoration: new InputDecoration(
          border: InputBorder.none,
          hintText: "Enter your number",
          //prefixIcon:Icon(Icons.phone_android_rounded),
          contentPadding: EdgeInsets.only(top: 20),
          prefixIcon: Padding(
            padding: EdgeInsets.only(top: 10), // add padding to adjust icon
            child: Icon(Icons.phone_android),
          ),
          //contentPadding:  EdgeInsets.only(left: 15, bottom: 8, top: 8, right: 15),


        ),

        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly
        ], // Only numbers can be entered
      ),

        //Text("Choose the prefered language",style:Utils.getHeaderWhiteStyle().copyWith(color: Colors.grey)
      ),

    );
  }

  Widget mobilenobox() {
    return new TextField(
      // autovalidateMode: AutovalidateMode.always,
      controller: textEditingController,

      keyboardType: TextInputType.text,
      cursorColor: Colors.blue[200],
      textInputAction: TextInputAction.done,
      autofocus: true,

      decoration: 
      InputDecoration(
        labelText: "Enter mobile",
        prefixIcon: Icon(
            Icons.phone_android, color: Colors.orange[200], size: 20),
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
    contentPadding:
    EdgeInsets.symmetric(vertical: 16),
    border:OutlineInputBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
        borderSide: BorderSide.none),
     focusedBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(color: Color(ColorCode.GREY_LIGHT_COLOR)),
  ),
  enabledBorder: OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: BorderSide(color: Color(ColorCode.GREY_LIGHT_COLOR)),
  ),
  );

  final boxdecoration = BoxDecoration(
    borderRadius : BorderRadius.only(

      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    boxShadow : [BoxShadow(
        color: Color.fromRGBO(0, 0, 0, 0.1),
        offset: Offset(0,3),
        blurRadius: 10
    )],
    color : Color.fromRGBO(255, 255, 255, 1),
  );

  String validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return "";
  }
}
