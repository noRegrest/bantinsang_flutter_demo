// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

abstract class BaseTheme {
  late Color background;
  late Color box;
  late Color textbox;
  late Color primary1;
  late Color primary2;
  late Color primary3;
  late Color primary4;
  late Color primary5;
  late Color primary6;
  late Color primary7;
  late Color secondary1;
  late Color secondary2;
  late Color successColor;
  late Color mainColor;
  late Color warningColor;
  late Color errorColor;
  late Color secondary3;
  late Color secondary4;
  late Color secondary5;
  late Color secondary6;
  late Color secondary7;
  late Color secondary8;
  late Color secondary9;
  late Color secondary10;
  late Color secondary11;
  late Color secondary12;
  late Color secondary13;
  late Color secondary14;
  late Color secondary15;

  late Brightness brightness;

  late BoxShadow boxShadow;
  late BoxShadow boxShadowButton;

  late List<Color> primaryButtonColor;
  late List<Color> successButtonColor;
  late List<Color> defaultButtonColor;
  late List<Color> dangerButtonColor;
}

class MyTheme implements BaseTheme {
  @override
  Color background = Color(0xFFFFFFFF);
  @override
  Color box = Color(0xFF1A1F47);
  @override
  Color textbox = Color(0xFF212134);
  @override
  Color primary1 = Color(0xFF730CF9);
  @override
  Color primary2 = Color(0xFFFFFFFF);
  @override
  Color primary3 = Color(0xFFD9D9D9);
  @override
  Color primary4 = Color(0xFFDAFFDE);
  @override
  Color primary5 = Color(0xFFFFF3F8);
  @override
  Color primary6 = Color(0xFFA0A3BD);
  @override
  Color primary7 = Color(0xFFF5F5F5);
  @override
  Color secondary1 = Color(0xFFD2B1FF);
  @override
  Color secondary2 = Color(0xFFC9C9C9);
  @override
  Color successColor = Color(0xFF2ED573);
  @override
  Color mainColor = Color(0xffD2B1FF);
  @override
  Color warningColor = Color(0xFFFFBE21);
  @override
  Color errorColor = Color(0xffDE2438);

  @override
  Color secondary3 = Color(0xFF15D656);
  @override
  Color secondary4 = Color(0xFFDE2438);
  @override
  Color secondary5 = Color(0xFF4A78FC);
  @override
  Color secondary6 = Color(0xFF81A9FF);
  @override
  Color secondary7 = Color(0xFF929292);
  @override
  Color secondary8 = Color(0xFF000000);
  @override
  Color secondary9 = Color.fromRGBO(255, 167, 0, 1);
  @override
  Color secondary10 = Color(0xFF5890FF);
  @override
  Color secondary11 = Color(0xFFEEF1F4);
  @override
  Color secondary12 = Color(0xFF667080);
  @override
  Color secondary13 = Color.fromARGB(255, 241, 241, 241);
  @override
  Color secondary14 = Color(0xFFFFA700);
  @override
  Color secondary15 = Color(0xFFC30052);
  @override
  Brightness brightness = Brightness.dark;

  @override
  BoxShadow boxShadow = BoxShadow(color: Colors.transparent);

  @override
  BoxShadow boxShadowButton = BoxShadow(color: Colors.transparent);

  @override
  List<Color> primaryButtonColor = [
    Color.fromRGBO(115, 12, 249, 1),
    Color.fromRGBO(165, 48, 250, 1),
  ];
  @override
  List<Color> successButtonColor = [
    Color.fromRGBO(12, 173, 66, 1),
    Color.fromRGBO(118, 240, 118, 1)
  ];
  @override
  List<Color> defaultButtonColor = [
    Color.fromRGBO(115, 12, 249, 1),
    Color.fromRGBO(115, 12, 249, 1)
  ];
  @override
  List<Color> dangerButtonColor = [
    Color.fromRGBO(199, 46, 62, 1),
    Color.fromRGBO(245, 83, 100, 1)
  ];
}
