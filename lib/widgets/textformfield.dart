import 'package:flutter/material.dart';
import 'package:stemapp/widgets/responsive_ui.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  String errormsg = "";

  final TextEditingController textEditingController;
  final TextInputType keyboardType;
  final bool obscureText;
  double _width = 0.0;
  double _pixelRatio = 0.0;
  bool large = false;
  bool valid = false;
  bool medium = false;

  CustomTextField({
    required this.hint,
    required this.textEditingController,
    required this.keyboardType,

    required this.errormsg,
    required this.valid,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      borderRadius: BorderRadius.vertical(),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: TextFormField(
        // autovalidateMode: AutovalidateMode.always,
        controller: textEditingController,
        keyboardType: keyboardType,
        cursorColor: Colors.blue[200],
        textInputAction: TextInputAction.next,
        autofocus: true,
        onFieldSubmitted: (value) {
          //Validator
        },
        decoration: InputDecoration(
          labelText: hint,
          //prefixIcon: Icon(icon, color: Colors.orange[200], size: 20),
          hintText: hint,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(),
              borderSide: BorderSide.none),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(),
              borderSide: BorderSide(color: Colors.lightBlueAccent)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.vertical(),
              borderSide: BorderSide(color: Colors.grey)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(color: Colors.red)),
        ),

        validator: (value) {
          if (valid) {
            if (value!.isEmpty) {
              return errormsg;
            }
          }

          return null;
        },
      ),
    );
  }
}
