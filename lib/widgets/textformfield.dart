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
      borderRadius: BorderRadius.circular(20),
      elevation: large ? 12 : (medium ? 10 : 8),
      child: Container(
        height: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: TextFormField(
          // autovalidateMode: AutovalidateMode.always,
          controller: textEditingController,
          keyboardType: keyboardType,
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
          validator: (value) {
            if (valid) {
              if (value!.isEmpty) {
                return errormsg;
              }
            }

            return null;
          },
        ),
      ),
    );
  }
}
