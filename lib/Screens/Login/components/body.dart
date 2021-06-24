import 'dart:convert';

import 'package:flutter/material.dart';

import 'background.dart';



class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}


final TextEditingController emailController = new TextEditingController();
class _BodyState extends State<Body> {

  var password, email;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Background(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Log in",
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20.0,),
                  textAlign: TextAlign.left,

                ),


              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, right: 20.0),
                alignment: Alignment.topLeft,

                child: Container(
                  alignment: Alignment.topLeft,
                  color: Color(0xff00249E), height: 6, width: 40,

                ),
              ),
              SizedBox(height: size.height * 0.03),

              SizedBox(height: size.height * 0.03),


              if (_isLoading) Center(child: CircularProgressIndicator()),

              SizedBox(height: size.height * 0.03),

            ],
          ),
        ),
      ),

    );
  }

  void logIn(email, password, BuildContext context) async {
    print('----------');
    print(email);
    print(password);


  }

}