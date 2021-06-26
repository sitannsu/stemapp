import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stemapp/Screens/Login/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stemapp/Screens/welcomescreen.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/utils.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>  with SingleTickerProviderStateMixin {

  var _visible = true;
  bool isLogin = false;

  AnimationController? animationController;
  Animation<double>? animation;
  String? _chosenValue;
  @override
  void initState() {
    super.initState();
    getStatus();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 2));
    animation =
    new CurvedAnimation(parent: animationController!, curve: Curves.easeOut);

    animation!.addListener(() => this.setState(() {}));
    animationController!.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  getStatus() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isLogin = prefs.getBool("islogin")!;
  }
  void navigationPage() async{


    // if(isLogin != null && isLogin) {
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    // }else{
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (BuildContext context) => LoginScreen()));
    // }

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(ColorCode.PRIMARY_COLOR),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[

              //Padding(padding: EdgeInsets.only(bottom: 30.0),child:new Image.asset('images/powered_by.png',height: 25.0,fit: BoxFit.scaleDown,))


            ],),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Image.asset(
                'assets/images/icon.png',
                width: animation!.value * 250,
                height: animation!.value * 250,
              ),
              Text("Welcome to",style:Utils.getTitleStyle().copyWith(color: Colors.white70)),
              SizedBox(height: 4,),
              Text("LifeApp".toUpperCase(),style:Utils.getActionbarHeaderStyle().copyWith(fontSize: 36)),
              SizedBox(height: 8,),

              rectanglebox(),
              nextbtn(),



            ],
          ),
        ],
      ),
    );
  }

  Widget nextbtn(){
    return GestureDetector(
      onTap: (){
        //Utils.routeTransitionStateFullWithReplace(context, welcomescreen());
        Utils.routeTransitionStateFullPush(context, welcomescreen());
      },
      child: Container(
          width: 121,
          height: 44,
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
            child: TextButton.icon(onPressed: null, label: Text("Enter",style: Utils.getHeaderWhiteStyle(),textAlign: TextAlign.center,), icon: Icon(Icons.arrow_back_ios,color: Colors.white,size: 18,),)),
          ),

      ),
    );
  }
dropdownbtn(){
    return DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        focusColor:Colors.white,
        value: _chosenValue,
        elevation: 5,
        //style: TextStyle(color: Colors.white),
        
        iconEnabledColor:Colors.orange,
        items: <String>[
          'English',
          'Hindi',
          'Telugu',
          'Tamil',
          'kannada',
          'Urdu',
          'Malaylam',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value,style:TextStyle(color:Colors.black54),),
          );
        }).toList(),
        hint:Text(
          "Choose the preffered langauage",
          style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500),
        ),
        onChanged: (String? value) {
          setState(() {
            _chosenValue = value;
          });
        },
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
     child: Center(child:  dropdownbtn()
     // Text("Choose the prefered language",style:Utils.getHeaderWhiteStyle().copyWith(color: Colors.grey)
     ),

   );
  }
}
