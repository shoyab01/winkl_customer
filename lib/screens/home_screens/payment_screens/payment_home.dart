import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class PaymentHome extends StatefulWidget {
  @override
  _PaymentHomeState createState() => _PaymentHomeState();
}

PaymentHome paymentHomeArgs;

class _PaymentHomeState extends State<PaymentHome> {
  final upiIdFormKey = GlobalKey<FormState>();
  TextEditingController upiIdController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    paymentHomeArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            height: MediaQuery.of(context).size.height - 100.0.h,
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 22.0.w, right: 22.0.w, top: 30.0.h, bottom: 10.0.h),
                  height: MediaQuery.of(context).size.height - 150.0.h,
                  child: Column(
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Icon(Icons.info, size: 24, color: Font_Style().primaryColor,),
                          SizedBox(width: 15.0.w,),
                          Flexible(
                            child: Text("Pay Rs 50/- Booking fees now to confirm your seat { Booking fee will adjusted to final Payment } or pay full fee now.",
                              style: Font_Style().montserrat_medium(Font_Style().secondaryColorWithOpacity, 14),
                            ),
                          ),
                        ],
                      ),
                      Spacer(flex: 32,),
                      Card(
                        elevation: 3.0,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                        child: Container(
                          padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
                          height: 127.0.h,
                          width: 350.0.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("UPI Payment", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),),
                              Spacer(flex: 2,),
                              Row(
                                children: <Widget>[
                                  upiPaymentItem("assets/icons/Google-Pay-Logo.png", "Google Pay"),
                                  upiPaymentItem("assets/icons/phone-pe.png", "Phone Pe"),
                                  upiPaymentItem("assets/icons/paytm-logo.png", "Paytm"),
                                ],
                              ),
                              Spacer(flex: 2,),
                            ],
                          ),
                        ),
                      ),
                      Spacer(flex: 30,),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "/add_card");
                          },
                          child: Container(
                            height: 30.0.h,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("+ Add New Card", style: Font_Style().montserrat_Bold(null, 16),),
                                Spacer(),
                                Padding(
                                    padding: EdgeInsets.only(left: 13.0.w),
                                    child: Text("Send and pay via Cards", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 8),))
                              ],
                            ),
                          ),
                        ),
                      ),
                      Spacer(flex: 380,),
                    ],
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/track_order");
                  },
                  child: Container(
                    height: 66.0.h,
                    color: Font_Style().primaryColor,
                    child: Center(
                      child: Text("Confirm Booking", style: Font_Style().montserrat_Bold(Colors.white, 14),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget upiPaymentItem(String image, String title) {
    return InkWell(
      onTap: () {
        switch(title) {
          case "Google Pay" :
            upiIdDialog("Google Pay");
            break;
          case "Phone Pe" :
            upiIdDialog("Phone Pe");
            break;
          case "Paytm" :
            upiIdDialog("Paytm");
            break;
          default:

        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 7.0.w, right: 7.0.w),
        height: 60.0.h,
        width: 60.0.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 40.0.h, width: 40.0.w,),
            Spacer(),
            Text(title, style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColorWithOpacity, 10),),
          ],
        ),
      ),
    );
  }

  void upiIdDialog(String title) {
    showDialog(context: context, builder: (BuildContext context) =>
        Dialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))
          ),
          child: Container(
            padding: EdgeInsets.only(top: 20.0.h, bottom: 20.0.h, left: 20.0.w, right: 20.0.w),
            height: 250.0.h,
            width: 350.0.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Add ${title} UPI Id", style: Font_Style().montserrat_Bold(null, 16),),
                Spacer(flex: 20,),
                Text("Enter your UPI ID HERE :", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),),
                Spacer(flex: 20,),
                Form(
                  key: upiIdFormKey,
                  child: TextFormField(
                    validator: (val){
                      return RegExp(r"^\w+@\w+$").hasMatch(val) ?
                      null : "Please enter a valid UPI ID";
                    },
                    controller: upiIdController,
                    maxLength: 35,
                    decoration:  InputDecoration(
                        counterText: "",
                    ),
                    keyboardType: TextInputType.text,
                    cursorColor: Font_Style().secondaryColor,
                    style:  Font_Style().textfield_style(),
                  ),
                ),
                Spacer(flex: 30,),
                Center(child: _buttonWidget(context)),
                Spacer(flex: 10,),
              ],
            ),
          ),
        )
    );
  }

  Widget _buttonWidget(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          if(upiIdFormKey.currentState.validate()) {
            Navigator.of(context).pop();
          }
        },
        child: Container(
          width: 234.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(30)),
          height: 48.h,
          child: Center(
            child: Text(
                "Continue",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}
