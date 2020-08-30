import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/otp_screens/get_otp.dart';

class ProfileHome extends StatefulWidget {
  @override
  _ProfileHomeState createState() => _ProfileHomeState();
}

class _ProfileHomeState extends State<ProfileHome> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.black
    ));
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22.0.w),
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Spacer(flex: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  ////////////////////////
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: 80.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(45),
                        border: Border.all(width: 1,style: BorderStyle.solid,color: Font_Style().primaryColor.withOpacity(0.2)),
                        image: DecorationImage(
                                          image: AssetImage("assets/icons/userprofiledefault.png"),
                                          fit: BoxFit.cover
                                      )
                      ),
                      //child: showImage(),
                    ),

                    Padding(
                      padding:  EdgeInsets.only(left: 58.w,top: 58.h),
                      child: Container(
                        width: 22.h,
                        height: 22.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: Font_Style().primaryColor
                        ),
                        child: Center(
                          child: Icon(Icons.edit,size: 18.h,color: Colors.white,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 18.0.w,),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Mr. John", style: Font_Style().montserrat_Bold(null, 20.0),),
                    SizedBox(height: 4.h,),
                    Text("john25@gmail.com", style: Font_Style().montserrat_Regular(null, 16.0),)
                  ],
                ),
              ),
            ],
          ),
          Spacer(flex: 32,),
          _list_title("ACCOUNT",Icons.person_outline),
          _profile_home_list_item("Change Password", "Change Password Here!", context),
          _profile_home_list_item("Change Mobile No.", "Change Mobile No.", context),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ImageIcon(AssetImage("assets/icons/grading.png"),size: 24,color: Font_Style().primaryColor,),
              SizedBox(width: 5.w,),
              Text("ABOUT US",style: Font_Style().montserrat_Bold(null, 16.0),),
            ],),
         Spacer(flex: 8,),
          Container(
            width: 345.w,
            height: 1,
            color: Font_Style().primaryColor.withOpacity(0.20),
          ),
        Spacer(flex: 20,),
          _profile_home_list_item("Customer Care", "/customer_care", context),
          _profile_home_list_item("Feedback & Suggestion", "/feedback_suggestion", context),
          _profile_home_list_item("Share with Friends", "", context),
          _profile_home_list_item("Rate us", "", context),
          _profile_home_list_item("Privacy & Policy", "", context),
          Spacer(flex: 100,),
        ],
      ),
    );
  }

  Widget _profile_home_list_item(String title,String route, context){
    return Padding(
      padding:  EdgeInsets.only(right: 21.w, bottom: 22.0.h),
      child: InkWell(
        onTap: () {
          print(route);
          if(route == "Change Password Here!") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetOtp(subTitle: "Change Password Here!",)),
            );
          }
          else if(route == "Change Mobile No.") {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetOtp(subTitle: "Change Mobile No.",)),
            );
          }
          else {
            Navigator.pushNamed(context, route);
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(title,style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 16.0),),
          ],
        ),
      ),
    );
  }

  Widget _list_title(String title,IconData icon){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(icon,size: 24,color: Font_Style().primaryColor,),
            SizedBox(width: 5.w,),
            Text(title,style: Font_Style().montserrat_Bold(null, 16.0),),
          ],),
        SizedBox(
          height: 7.5.h,
        ),
        Container(
          width: 345.w,
          height: 1,
          color: Font_Style().primaryColor.withOpacity(0.20),
        ),
        SizedBox(
          height: 20.5.h,
        )
      ],
    );
  }
}
