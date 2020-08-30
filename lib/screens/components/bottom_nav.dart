import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/home_screens/home.dart';
import 'package:winkl_customer/screens/profile_screens/profile_home.dart';

import '../../common_widgets.dart';

class BottomNav extends StatefulWidget {
  var currentIndex;
  BottomNav({this.currentIndex});

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  List<Widget> _list;

  @override
  void initState() {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => locBottomSheet());

    if(widget.currentIndex==null){
      setState(() {
        widget.currentIndex=0;
      });
    }
    setState(() {
      _list=[
        Home(),
        Container(),
        Container(),
        ProfileHome(),
      ];
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future.value(false);
      },
      child: Scaffold(
        body: SafeArea(
            child: _list[widget.currentIndex]
        ),
        bottomNavigationBar: SizedBox(
          height: 65.0.h,
          child: BottomNavigationBar(
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                title: Text("Home"),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                    child: Icon(FontAwesomeIcons.home)),
              ),
              BottomNavigationBarItem(
                title: Text("Search"),
                icon: Padding(
                  padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                    child: Icon(Icons.search)),
              ),
              BottomNavigationBarItem(
                title: Text("Cart"),
                icon: Padding(
                    padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                    child: Icon(Icons.shopping_cart)),
              ),
              BottomNavigationBarItem(
                title: Text("Account"),
                icon: Padding(
                    padding: EdgeInsets.only(top: 5.0.h, bottom: 5.0.h),
                    child: Icon(Icons.person_outline)),
              ),
            ],
            iconSize: 26.h,
            showUnselectedLabels: true,
            selectedItemColor: Font_Style().primaryColor,
            unselectedItemColor: Color.fromRGBO(7, 9, 32, 0.5),
            currentIndex:widget.currentIndex,
            selectedLabelStyle: Font_Style().montserrat_Bold(null, 9.0),
            unselectedLabelStyle: Font_Style()
                .montserrat_Regular(Color.fromRGBO(7, 9, 32, 0.5), 9.0),
            onTap: (val) {
              setState(() {
                widget.currentIndex=val;
              });
            },
          ),
        ),
      ),
    );
  }

  void locBottomSheet(){
    showModalBottomSheet(
        context: (context),
        enableDrag: false,
        isDismissible: false,
        builder: (context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Container(
                  color: Color(0XFF737373),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Font_Style().primaryColor,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    height: 289.h,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(top: 20.h, left: 23.w, right: 23.w),
                          height: 102.0.h,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Icon(Icons.gps_not_fixed, color: Colors.white, size: 24,),
                                  Spacer(flex: 1,),
                                  Text("Device Location is off", style: Font_Style().montserrat_Bold(Colors.white, 16),),
                                  Spacer(flex: 3,),
                                  commonButtonWidget(context, "Turn On", 16, 103.0.w, 34.0.h, Colors.white, Font_Style().primaryColor, "/bottom_nav")
                                ],
                              ),
                              Spacer(),
                              Text("Turning on device location will help us to find best service for you!", textDirection: TextDirection.ltr, style: Font_Style().montserrat_Regular(Colors.white, 14),),
                            ],
                          ),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.only(top: 20.h, left: 23.w, right: 23.w),
                          color: Colors.white,
                          height: 178.0.h,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  ///////////////////////////////////////////////////
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Icon(Icons.search, color: Font_Style().secondaryColor, size: 24,),
                                      SizedBox(width: 8.0.w,),
                                      Text("Enter Location Manually", style: Font_Style().montserrat_medium(null, 16),),
                                    ],
                                  ),
                                ),
                              ),
                              Spacer(),
                              Divider(
                                color: Color.fromRGBO(3, 90, 166, 0.2),
                                thickness: 1,
                              ),
                              Spacer(),
                              commonButtonWidget(context, "Proceed", 19, 234.0.w, 48.0.h, Font_Style().primaryColor, Colors.white, "/bottom_nav"),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          );
        });
  }
}
