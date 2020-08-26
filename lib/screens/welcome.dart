import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ThemeData/fontstyle.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  void initState() {
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacementNamed("/login");
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, width: 390, height: 812, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Font_Style().primaryColor,
      body: SafeArea(
        child: Center(
          child: Container(
              padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
              child: Text("Welcome Screen", style: Font_Style().montserrat_Bold(null, 22),)),
        ),
      ),
    );
  }
}