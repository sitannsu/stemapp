import 'dart:ui';

import 'package:flutter/material.dart';

class ColorCode{
  static MaterialColor colorCustom = MaterialColor(PRIMARY_COLOR, color);
  static final int PRIMARY_COLOR = 0XFFFFA800;
  static final int PRIMARYS_COLOR = 0XFFFF9900;
  static final int SECONDARY_COLOR = 0XFFFFFFF4;
  static final int HEADER_LEFT_COLOUR = 0XFF4585E5;
  static final int HEADER_RIGHT_COLOUR = 0XFF45E5BB;
  static final int BTN_COLOUR = 0XFFFF9900;
  static final int UNSELECT_COLOUR = 0XFF969696;

  static final int GREY_LIGHT_COLOR = 0XFFC0C0C0;
  static final int CLINIC_REGISTRATION_COLOR = 0XFF4141a3;
  static final int PLACEHOLDER_COLOR = 0XFFC6C6C6;
  static final int TEXTFIELD_BORDER_COLOR = 0XFF555555;
  static final int TEXT_COLOR = 0XFF8d8d8d;
  static final int BG_COLOR = 0XFFf2f2f7;

  static final Color GREY_COLOR = Color(0XFFEDEDED);
  static final Color LIGHT_BLUE_COLOR = Color(0XFF8BA9E0);

  static final Color EXCELLENT_COLOR = Color(0XFF599B40);
  static final Color GOOD_COLOR = Color(0XFFB3DEAA);
  static final Color AVERAGE_COLOR = Color(0XFFFEFB53);
  static final Color BELOW_AVERAGE_COLOR = Color(0XFFC78E89);
  static final Color POOR_COLOR = Color(0XFFCF381F);


  //Background color : f2f2f7
  //Text color - 8d8d8d

  static Map<int, Color> color =
  {
    50:Color.fromRGBO(136,14,79, .1),
    100:Color.fromRGBO(136,14,79, .2),
    200:Color.fromRGBO(136,14,79, .3),
    300:Color.fromRGBO(136,14,79, .4),
    400:Color.fromRGBO(136,14,79, .5),
    500:Color.fromRGBO(136,14,79, .6),
    600:Color.fromRGBO(136,14,79, .7),
    700:Color.fromRGBO(136,14,79, .8),
    800:Color.fromRGBO(136,14,79, .9),
    900:Color.fromRGBO(136,14,79, 1),
  };


}