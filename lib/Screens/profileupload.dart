import 'package:flutter/material.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/utils.dart';

class Profileupload extends StatefulWidget {
  @override
  _ProfileuploadState createState() => _ProfileuploadState();
}

class _ProfileuploadState extends State<Profileupload> {
  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
     return Scaffold(
      // backgroundColor: Color(ColorCode.PRIMARY_COLOR),
      body: Container(
        height: deviceSize.height,
        width: deviceSize.width,
        // color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: deviceSize.height / 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Welcome",
                  style: Utils.getHeaderPrimaryStyle().copyWith(fontSize: 35),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "To the world of gappu and baba",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Help us setup you account! \nplease uplaod a beautiful picture of yours \nto setup your profile!",
                  style: TextStyle(color: Colors.black54, fontSize: 16),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
            SizedBox(
              height: deviceSize.height / 8,
            ),
            CircleAvatar(
              radius: 65,
              backgroundColor: Colors.orangeAccent,
              child: CircleAvatar(
                radius: 62,
                backgroundImage: AssetImage(""),
              ),
            ),
            SizedBox(
              height: deviceSize.height / 8,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: deviceSize.width / 9),
              child: uploadbtn(
                widget: Directionality(
                  textDirection: TextDirection.rtl,
                  child: Text(
                    "Upload Profile Image",
                    style: Utils.getHeaderWhiteStyle(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceSize.height * 0.05,
            ),
            Positioned(
              right: 0,
              child: Padding(
                padding: EdgeInsets.only(right: 50, left: deviceSize.width / 2),
                child: uploadbtn(
                  widget: Directionality(
                      textDirection: TextDirection.rtl,
                      child: TextButton.icon(
                        onPressed: () {
                          print("object");
                        },
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
            )
          ],
        ),
      ),
    );
  }

  Widget uploadbtn({required Widget widget}) {
    return GestureDetector(
      onTap: () {
        //Utils.routeTransitionStateFullWithReplace(context, welcomescreen());
        // Utils.routeTransitionStateFullPush(context, welcomescreen());
      },
      child: Container(
        // width: 121,
        height: 44,
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
        child: Center(child: widget
          //Text("Enter",style:Utils.getHeaderWhiteStyle())

        ),
      ),
    );
  }
}


