import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/otp_screens/verify_otp.dart';

class GetOtp extends StatefulWidget {
  final String subTitle;
  GetOtp({this.subTitle});

  @override
  _GetOtpState createState() => _GetOtpState();
}

GetOtp getOtpArgs;

class _GetOtpState extends State<GetOtp> {
  final getOtpFormKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    getOtpArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back, color: Font_Style().secondaryColor, size: 24,)),
      ),
      body: SafeArea(
        child: KeyboardAvoider(
          //autoScroll: true,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
              height: MediaQuery.of(context).size.height - 100,
              width: 327.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/get_otp.png", width: 277.0.w, height: 180.0.h,),
                  Spacer(flex: 66,),
                  Text("OTP Verification", textAlign: TextAlign.center, style: Font_Style().montserrat_ExtraBold(null, 24),),
                  Spacer(flex: 16,),
                  Text("We will send you OTP at your Mobile Number",textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(null, 16),),
                  Spacer(flex: 47,),
                  Text("Enter Mobile Number", textAlign: TextAlign.center, style: Font_Style().montserrat_medium(Color.fromRGBO(143, 159, 162, 0.5), 12),),
                  Spacer(flex: 10,),
                  Form(
                    key: getOtpFormKey,
                    child: TextFormField(
                        validator: (val){
                          return val.isEmpty || val.length < 10 ? "Please Enter a valid Phone Number" : null;
                        },
                        controller: phoneNumber,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 20.0.h, bottom: 10.0.h),
                          prefixIcon: Padding(padding: EdgeInsets.only(left: 5.0.w, right: 10.0.w, top: 20.0.h, bottom: 10.0.h), child: Text('+91 ', style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 16),)),
                        ),
                        maxLength: 10,
                        autofocus: false,
                        keyboardType: TextInputType.number,
                        cursorColor: Font_Style().secondaryColor,
                        style:  Font_Style().textfield_style()),
                  ),
                  Spacer(flex: 60,),
                  _buttonWidget(context),
                  Spacer(flex: 181,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttonWidget(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          print("get otp" + widget.subTitle);
          if(getOtpFormKey.currentState.validate()) {
            Navigator.pushNamed(context, "/verify_otp", arguments: VerifyOtp(subTitle: widget.subTitle,));
          }
        },
        child: Container(
          width: 234.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(30)),
          height: 48.h,
          child: Center(
            child: Text(
                "Get OTP",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}
