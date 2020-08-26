import 'package:flutter/material.dart';
import 'ThemeData/fontstyle.dart';

Widget commonButtonWidget(BuildContext context, String title, double textSize, width, height, Color buttonColor, Color textColor, String navigateTo) {
  return Container(
    child: InkWell(
      onTap: (){
        //Navigator.pushNamed(context, navigateTo);
        Navigator.of(context).pop();
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
            color: buttonColor, borderRadius: BorderRadius.circular(30)),
        height: height,
        child: Center(
          child: Text(
            title,
            style: Font_Style().montserrat_Bold(textColor, textSize),
          ),
        ),
      ),
    ),
  );
}