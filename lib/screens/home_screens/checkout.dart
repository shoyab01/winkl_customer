import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  int noOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 18.0.w, right: 18.0.w, top: 10.0.h, bottom: 10.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Container(
                          width: 70.0.w,
                          height: 70.0.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5.0)),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage("assets/icons/barber_shop.png")
                              )
                          )
                      ),
                      SizedBox(width: 10.0.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Shop Name", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),),
                          Text("Item Address", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 12),)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 35.0.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        width: 150.0.w,
                          child: Text("Item Name", overflow: TextOverflow.clip, textAlign: TextAlign.left, maxLines: 2, style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),)),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                        height: 24.0.h,
                        width: 67.0.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Font_Style().secondaryColor,
                            width: 0.5.w,
                          )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(noOfItems > 0) {
                                    noOfItems -= 1;
                                  }
                                });
                              },
                                child: Text("-", style: Font_Style().montserrat_SemiBold(Colors.grey, 22),)),
                            Text(noOfItems.toString(), style: Font_Style().montserrat_SemiBold(Colors.green, 14),),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  noOfItems += 1;
                                });
                              },
                                child: Text("+", style: Font_Style().montserrat_SemiBold(Colors.green, 18),))
                          ],
                        ),
                      ),
                      Text("₹${149 * noOfItems}", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 14),),
                    ],
                  ),
                  SizedBox(height: 50.0.h,),
                  Row(
                    children: <Widget>[
                      Text("Tip your delivery partner", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),),
                      SizedBox(width: 12.0.w,),
                      Text("How it works", style: Font_Style().montserrat_Bold(Font_Style().primaryColor, 12),)
                    ],
                  ),
                  SizedBox(height: 8.0.h,),
                  Text("Thank your delivery partner for helping you stay safe indoors. Support them through these tough times with a tip.", textAlign: TextAlign.left, maxLines: 3, style: Font_Style().montserrat_Light(Font_Style().secondaryColor, 12),),
                  SizedBox(height: 20.0.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.0.w),
                          height: 32.0.h,
                            width: 60.0.w,
                            child: Center(child: Text("₹20", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),))),
                      ),
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.0.w),
                            height: 32.0.h,
                            width: 60.0.w,
                            child: Center(child: Text("₹30", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),))),
                      ),
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.0.w),
                            height: 32.0.h,
                            width: 60.0.w,
                            child: Center(child: Text("₹50", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),))),
                      ),
                      Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Container(
                            padding: EdgeInsets.symmetric(vertical: 1.5.h, horizontal: 3.0.w),
                            height: 32.0.h,
                            width: 60.0.w,
                            child: Center(child: Text("other", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),))),
                      ),
                    ],
                  ),
                  SizedBox(height: 50.0.h,),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xff818181).withOpacity(0.5),
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.local_offer, size: 24.0, color: Font_Style().secondaryColor,),
                      Spacer(flex: 1,),
                      Text("APPLY COUPON", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),),
                      Spacer(flex: 10,),
                      Icon(Icons.arrow_forward_ios, size: 18.0, color: Font_Style().secondaryColorWithOpacity,),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xff818181).withOpacity(0.5),
                  ),
                  SizedBox(height: 30.0.h,),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("Bill Details", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),)),
                  SizedBox(height: 12.0.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Item Total", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 12),),
                      Text("₹${149 * noOfItems}", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 12),),
                    ],
                  ),
                  SizedBox(height: 7.0.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Delivery partner fee", style: Font_Style().montserrat_Regular_Underline(Font_Style().primaryColor, 12),),
                      Text("₹60", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 12),),
                    ],
                  ),
                  SizedBox(height: 5.0.h,),
                  Align(
                    alignment: Alignment.centerLeft,
                      child: Text("This fees goes towards paying your Delivery Partner fairly", textAlign: TextAlign.left, maxLines: 2, style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 11),)),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xff818181).withOpacity(0.5),
                  ),
                  SizedBox(height: 20.0.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Delivery Tip", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 14),),
                      Text("Add tip", style: Font_Style().montserrat_SemiBold(Colors.orange, 14),),
                    ],
                  ),
                  SizedBox(height: 10.0.h,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Taxes and Charges", style: Font_Style().montserrat_Regular_Underline(Font_Style().primaryColor, 12),),
                      Text("₹14.23", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 12),),
                    ],
                  ),
                  Divider(
                    thickness: 0.5,
                    color: Color(0xff818181).withOpacity(0.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("To Pay", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),),
                      Text("₹${149 * noOfItems + 60 + 14.23}", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 14),),
                    ],
                  ),
                  SizedBox(height: 70.0.h,),
                  _buttonWidget(context),
                ],
              )
          ),
        ),
      ),
    );
  }

  Widget _buttonWidget(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, "/payment_home");
        },
        child: Container(
          width: 254.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(5)),
          height: 48.h,
          child: Center(
            child: Text(
                "Proceed to pay Bill",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}
