import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/components/bottom_nav.dart';
import 'package:winkl_customer/screens/forget_change_password/reset_password.dart';

class VerifyOtp extends StatefulWidget {
  final String subTitle;
  VerifyOtp({this.subTitle});

  @override
  _VerifyOtpState createState() => _VerifyOtpState();
}

final FocusNode _pinPutFocusNode = FocusNode();
VerifyOtp verifyOtpArgs;

class _VerifyOtpState extends State<VerifyOtp> {
  TextEditingController otpController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    verifyOtpArgs = ModalRoute.of(context).settings.arguments;

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
          autoScroll: true,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, bottom: 10.0.h),
              height: MediaQuery.of(context).size.height - 100,
              width: 327.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/verify_otp.png", width: 313.0.w, height: 200.0.h,),
                  Spacer(flex: 45,),
                  Text("OTP Verification", style: Font_Style().montserrat_ExtraBold(null, 24),),
                  Spacer(flex: 16,),
                  Text("Enter the OTP send to the number ", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(null, 16),),
                  Spacer(flex: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Spacer(flex: 2,),
                      Text("+91 5451xxxx264", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(null, 16),),
                      Spacer(flex: 4,),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/get_otp");
                        },
                          child: Text("Edit", style: Font_Style().montserrat_Regular_Underline(Color.fromRGBO(214, 25, 63, 1), 12),)),
                      Spacer(flex: 2,),
                    ],
                  ),
                  Spacer(flex: 52,),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.h),
                    padding: EdgeInsets.only(left: 20.0.w, right: 20.0.w, bottom: 20.0.h),
                    child: PinPut(
                      fieldsCount: 4,
                      onSubmit: ((String pin) => () {

                      }),
                      autofocus: true,
                      focusNode: _pinPutFocusNode,
                      controller: otpController,
                      submittedFieldDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Font_Style().secondaryColor.withOpacity(0.2),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)
                      ),
                      selectedFieldDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Font_Style().secondaryColor.withOpacity(0.2),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                4.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          color: Colors.white,
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(2)
                      ),
                      followingFieldDecoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Font_Style().secondaryColor.withOpacity(0.2),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(
                                0.0, // Move to right 10  horizontally
                                2.0, // Move to bottom 10 Vertically
                              ),
                            )
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(2)
                      ),
                    ),
                  ),
                  Spacer(flex: 52,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Didn't receive OTP?  ", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(Color.fromRGBO(3, 90, 166, 1), 14),),
                      InkWell(
                          onTap: () {
                            /////////////////////////////////
                          },
                          child: Text("RESEND", textAlign: TextAlign.center, style: Font_Style().montserrat_medium(Color.fromRGBO(3, 90, 166, 1), 14),)),
                    ],
                  ),
                  Spacer(flex: 52,),
                  _buttonWidget(context),
                  Spacer(flex: 120,),
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
          print("verify" + verifyOtpArgs.subTitle);
          if(otpController.text.length == 4) {
            if(verifyOtpArgs.subTitle == "") {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNav(currentIndex: 0,)),
              );
            }
            else if(verifyOtpArgs.subTitle == "Change Mobile No.") {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BottomNav(currentIndex: 0,)),
              );
            }
            else if(verifyOtpArgs.subTitle == "Change Password Here!" || verifyOtpArgs.subTitle == "Forgot Password? Don't Worry"){
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/reset_password", arguments: ResetPassword(rPSubTitle: verifyOtpArgs.subTitle,));
            }
          }
        },
        child: Container(
          width: 234.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(30)),
          height: 48.h,
          child: Center(
            child: Text(
                "Verify & Proceed",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}
