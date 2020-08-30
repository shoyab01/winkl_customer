import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class CustomerCare extends StatefulWidget {
  @override
  _CustomerCareState createState() => _CustomerCareState();
}

class _CustomerCareState extends State<CustomerCare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, size: 24.0, color: Font_Style().secondaryColor,)),
        title: Text("Customer Care", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, bottom: 10.0.h, top: 10.0.h),
            child: Column(
              children: <Widget>[
                Spacer(flex: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Write us Email on :", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),)),
                Spacer(flex: 10,),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text('"Saloonhair@gmail.com"', textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(Color.fromRGBO(3, 90, 166, 1), 16),)),
                Spacer(flex: 75,),
                Image.asset("assets/icons/customer_care_image.png", width: 305.0.w, height: 305.0.h,),
                Spacer(flex: 250,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
