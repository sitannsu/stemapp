import 'package:flutter/material.dart';
import 'package:stemapp/widgets/textformfield.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool apiCalled = false;

  TextEditingController emailController = TextEditingController();
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController refcodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cpasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "First Name",
      errormsg: 'Enter First Name',
      textEditingController: fnameController,
      valid: true,
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      hint: "Last Name",
      errormsg: 'Enter Last Name',
      textEditingController: lnameController,
      valid: true,
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