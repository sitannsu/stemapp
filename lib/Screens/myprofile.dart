import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:stemapp/core/constants/ColorCode.dart';
import 'package:stemapp/datasource/remote/remote_datasource.dart';
import 'package:stemapp/model/MyProfileData.dart';
import 'package:stemapp/utils/utils.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool apiCalled = false;

  //Map<String, dynamic> response;
  MyProfileData? response;
  Results? profileData;

  String mUserId = "";
  @override
  void initState() {
    // TODO: implement initState
    getData();
    super.initState();
  }

  getData() async {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // var mUserId = prefs.getString("userId");
    //response = await RemoteDatasource().profileData(mUserId!);
    print('inside profile');
    response = await RemoteDatasource().profileData();
    //mUserType = prefs.getString("usertype"); //1 for admin 2 for user

    print(response);

    setState(() {
      apiCalled = true;
      profileData = response!.results;
      print(response!.results!.id);
      //print("omg${profileData!.id}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Material(
          borderRadius: BorderRadius.circular(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                headerWidget(),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ratingwidget(),
                    ),
                    SizedBox(height: 8.0),
                    firstRow(),
                    Text("Your Account!", style: Utils.getTextBlackStyle()),
                    secondRow(),
                    thirdRow(),
                    SizedBox(height: 6.0),
                    versionWidget(),
                    Divider(color: Colors.black54),
                    resetWidget(),
                    Divider(color: Colors.black54),
                    follomeWidget(),
                    Divider(color: Colors.black54),
                    feedbackWidget(),
                    Divider(color: Colors.black54),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        "Terms & Conditions and Privacy Policies",
                        style: Utils.getTextBlackStyle(),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Divider(color: Colors.black54),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget secondRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/coins.jpg")),
                  Text("name", style: Utils.getTextBlackStyle()),
                  Text("Gold Coins", style: Utils.getLabelSmallStyle()),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/green_coins.png")),
                  Text("name", style: Utils.getTextBlackStyle()),
                  Text("Green Coins", style: Utils.getLabelSmallStyle()),
                ],
              ),
            ),
          ),
        ]);
  }

  Widget thirdRow() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: [
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/king.png")),
                  Text("60", style: Utils.getTextBlackStyle()),
                  Text("Knowledge Points", style: Utils.getLabelSmallStyle()),
                ],
              ),
            ),
          ),
          Card(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                      height: 100,
                      width: 100,
                      child: Image.asset("assets/images/heart.png")),
                  Text("name", style: Utils.getTextBlackStyle()),
                  Text("Hearts", style: Utils.getLabelSmallStyle()),
                ],
              ),
            ),
          ),
        ]);
  }

  Widget firstRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            Container(
              height: 100,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("name", style: Utils.getTextBlackStyle()),
                        Text(
                          "Activities  \n Completed!",
                          style: Utils.getLabelSmallStyle(),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Container(
                        height: 180,
                        child: Image.asset("assets/images/icon.png"))
                  ],
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Container(
              height: 100,
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("name", style: Utils.getTextBlackStyle()),
                        Text(
                          "Activities \n Completed!",
                          style: Utils.getLabelSmallStyle(),
                          maxLines: 2,
                        ),
                      ],
                    ),
                    Container(
                        height: 180,
                        child: Image.asset("assets/images/icon.png"))
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget ratingwidget() {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text("name", style: Utils.getTextBlackStyle()),
        // Icon(Icons.star,color: Colors.yellow,size: 14,),

        Row(
          children: List.generate(
              3,
              (index) => Icon(
                    Icons.star,
                    color: Colors.orange,
                  )),
        ), //for loop add
      ],
    );
  }

  Widget versionWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Version",
            style: Utils.getTextBlackStyle(),
          ),
          Text("2.0"),
        ],
      ),
    );
  }

  Widget resetWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Reset Pin",
            style: Utils.getTextBlackStyle(),
          ),
          Icon(Icons.arrow_forward_ios),
        ],
      ),
    );
  }

  Widget feedbackWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 6, bottom: 4),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Feedback",
            style: Utils.getTextBlackStyle(),
          ),
          Text("feedback@lifelab.com",
              style: Utils.getSubTitleStyle().copyWith(color: Colors.cyan)),
        ],
      ),
    );
  }

  follomeWidget() {
    return new Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          children: [
            Text(
              "Follow me on",
              style: Utils.getTextBlackStyle(),
            ),
            SizedBox(height: 6.0),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.insert_chart),
                Icon(Icons.transfer_within_a_station),
                Icon(Icons.linked_camera),
              ],
            ),
            SizedBox(height: 4),
            Text("@lifelab", style: Utils.getLabelSmallStyle()),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return new Container(
      height: 192,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        color: Color(ColorCode.PRIMARY_COLOR),
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white, size: 18),
                  Icon(Icons.edit, color: Colors.white, size: 18),
                ],
              ),
            ),
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white,
              child: CircleAvatar(
                radius: 43,
                backgroundImage: AssetImage("assets/images/king.png"),
              ),
            ),
            // Text(profileData!.studentName.toString(),
            //     style: Utils.getTitleWhiteStyle()),
            SizedBox(height: 6),
            Text("details", style: Utils.getLabelWhiteStyle()),
          ],
        ),
      ),
    );
  }
}
