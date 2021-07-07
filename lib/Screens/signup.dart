import 'package:flutter/material.dart';
import 'package:stemapp/Screens/verification.dart';
import 'package:stemapp/datasource/remote/remote_datasource.dart';
import 'package:stemapp/utils/ColorCode.dart';
import 'package:stemapp/utils/constants.dart';
import 'package:stemapp/utils/utils.dart';
import 'package:stemapp/widgets/textformfield.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:shared_preferences/shared_preferences.dart';


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

  DateTime _date = DateTime.now();
  Future<dynamic> showDate(BuildContext context) async {
    DateTime? datePicker = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(1947),
        lastDate: DateTime(2030));
    if (datePicker != null && datePicker != _date) {
      setState(() {
        _date = datePicker;
      });
    }
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 500,
            width: deviceSize.width,
            color: Color(ColorCode.PRIMARY_COLOR),
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
                padding: const EdgeInsets.only(left: 20.0, top: 8),
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

  var finaldata = "Date of birth";

  Widget dob() {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Material(
        borderRadius: BorderRadius.circular(20),
        elevation: 10,
        child: TextFormField(
          // autovalidateMode: AutovalidateMode.always,
          controller: dobController,
          readOnly: true,
          onTap: () {
            showDate(context).then((value) {
              setState(() {
                finaldata = _date.toString().substring(0, 11);
              });
            });
          },

          // cursorColor: Colors.blue[200],
          textInputAction: TextInputAction.next,
          autofocus: true,
          onFieldSubmitted: (value) {
            //Validator
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            // labelText: hint,
            suffixIcon: IconButton(
              onPressed: () {
                print("ok");
              },
              icon: Icon(Icons.calendar_today_outlined,
                  color: Colors.blueGrey, size: 20),
            ),
            hintText: finaldata,
          ),
        ),
      ),
    );
  }

  dobField({String? hint}) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 12,
      child: Container(
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          // autovalidateMode: AutovalidateMode.always,
          // controller: controller,
          readOnly: true,
          // keyboardType: keyboardType,
          // cursorColor: Colors.blue[200],
          textInputAction: TextInputAction.next,
          autofocus: true,
          onFieldSubmitted: (value) {
            //Validator
          },

          decoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
            // labelText: hint,
            //prefixIcon: Icon(icon, color: Colors.orange[200], size: 20),
            hintText: hint,
          ),
        ),
      ),
    );
  }

  Widget signupbtn() {
    return GestureDetector(
      onTap: () async {
        if (addressController.text.isNotEmpty &&
            cityController.text.isNotEmpty &&
            genderController.text.isNotEmpty &&
            gradeController.text.isNotEmpty &&
            phoneController.text.isNotEmpty &&
            phoneController.text.length == 10 &&
            schoolController.text.isNotEmpty &&
            stateController.text.isNotEmpty &&
            stateController.text.isNotEmpty &&
            fnameController.text.isNotEmpty) {

          await RemoteDatasource()
              .userSignUp(
            address: addressController.text,
            city: cityController.text,
            dateOfbirth: finaldata,
            deviceId: Utils.getDeviceId().toString(),
            gender: genderController.text,
            grade: gradeController.text,
            phoneNumber: phoneController.text,
            schoolName: schoolController.text,
            state: stateController.text,
            studentName: fnameController.text,
          )
              .then((value) async {
            setState(() {});
            if (value["status"] == 403) {
              isLoading = false;
              return Flushbar(
                flushbarPosition: FlushbarPosition.TOP,

                title: 'Hey',
                message: 'This phone number is already registered.',
                duration: Duration(seconds: 3),
              ).show(context);
            }
            if (value["status"] == 200) {
              isLoading = true;
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setInt(Constants.USER_ID, value["user_id"]);
              prefs.setString(Constants.USER_MOBILE, phoneController.text);

              //SharedPrefs.saveValue(key: "userId", value: value["user_id"]);
              //SharedPrefs.saveValue(  key: "userMobNo", value: phoneController.text);

              return Flushbar(
                flushbarPosition: FlushbarPosition.TOP,
                title: 'Hey ',
                message: "Registered Successfully.",
                duration: Duration(seconds: 2),
              ).show(context).then((value) {
                isLoading = false;
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => VerificationScreen()));
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
            content: const Text('Please fill all fields'),
            duration: const Duration(seconds: 1),
          ));
        }
      },
      child: isLoading
          ? customLoginLoader(text: "please wait")
          : Padding(
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
