import 'package:flutter/material.dart';
import 'package:stemapp/Screens/verification.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/constants.dart';
import 'package:stemapp/utils/utils.dart';
import 'package:stemapp/widgets/textformfield.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool apiCalled = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController gradeController = TextEditingController();
  TextEditingController refcodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController schoolController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            width: deviceSize.width,
            color: Color(ColorCode.PRIMARYS_COLOR),
            child: Container(
              height: 160,
              width: deviceSize.width / 2,
              alignment: Alignment.topRight,
              child: Image.asset(
                'assets/images/signup.png',
                height: 160,
              ),
            ),
          ),
          ListView(
            padding: EdgeInsets.all(
                0), // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Sign Up!",
                  style: Utils.getActionbarHeaderStyle().copyWith(fontSize: 35),
                  textAlign: TextAlign.start,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0,top: 8),
                child: Text(
                  "To experience the world of \ngappu and bobo!",
                  style: TextStyle(
                    fontFamily: 'OpenSans-Regular',
                    fontSize: 16.0,
                    color: Colors.white60,
                    fontWeight: FontWeight.w700,
                    // letterSpacing: 0.16,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: kPrimaryGreyColor.withOpacity(0.2),
                        offset: const Offset(1.1, 1.1),
                        blurRadius: 10.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 30),
                  child: Container(
                    // height: 565,
                    // maxHeight: tempHeight > infoHeight
                    //     ? tempHeight
                    //     : infoHeight),
                    child: Column(
                      children: [
                        nameTextFormField(),
                        SizedBox(height: 16),
                        dob(),
                        SizedBox(height: 16),
                        genderTextFormField(),
                        SizedBox(height: 16),
                        gradeTextFormField(),
                        SizedBox(height: 16),
                        schoolnameTextFormField(),
                        SizedBox(height: 16),
                        addressTextFormField(),
                        SizedBox(height: 16),
                        phoneTextFormField(),
                        SizedBox(height: 16),
                        statenameTextFormField(),
                        SizedBox(height: 16),
                        citynameTextFormField(),
                        SizedBox(height: 16),
                        signupbtn(),
                        SizedBox(height: 26),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget nameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Child Name",

      errormsg: 'Enter Child Name',
      textEditingController: fnameController,
      valid: true,
    );
  }

  Widget statenameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "State Name",
      errormsg: 'Enter State ',
      textEditingController: stateController,
      valid: true,
    );
  }

  Widget citynameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "City ",
      errormsg: 'Enter City Name',
      textEditingController: cityController,
      valid: true,
    );
  }

  Widget schoolnameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "School Name",
      errormsg: 'Enter School Name',
      textEditingController: schoolController,
      valid: true,
    );
  }

  Widget genderTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Gender",
      errormsg: 'Enter Gender',
      textEditingController: genderController,
      valid: true,
    );
  }

  Widget gradeTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Grade",
      errormsg: 'Enter Grade',
      textEditingController: gradeController,
      valid: true,
    );
  }
  Widget dob(){
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),

      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,

        child: TextFormField(
          // autovalidateMode: AutovalidateMode.always,
          controller: dobController,

          // cursorColor: Colors.blue[200],
          textInputAction: TextInputAction.next,
          autofocus: true,
          onFieldSubmitted: (value) {
            //Validator
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            // labelText: hint,
            suffixIcon: Icon(Icons.calendar_today_outlined, color: Colors.blueGrey, size: 20),
            hintText: "Date of birth",

          ),


        ),
      ),
    );
  }

  Widget signupbtn() {
    return GestureDetector(
      onTap: () {
        //Utils.routeTransitionStateFullWithReplace(context, welcomescreen());
        Utils.routeTransitionStateFullPush(context, VerificationScreen());
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 18.0),
        child: Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 107,
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
                      "SignUp",
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
      ),
    );
  }

  Widget addressTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Address",
      errormsg: '',
      textEditingController: addressController,
      valid: false,
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      hint: "Email ID",
      errormsg: '11',
      textEditingController: emailController,
      valid: true,
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      hint: "Mobile Number",
      errormsg: '11',
      textEditingController: phoneController,
      valid: true,
    );
  }
}
