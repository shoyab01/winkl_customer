import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class ResetPassword extends StatefulWidget {
  final String rPSubTitle;
  ResetPassword({this.rPSubTitle});

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

bool _isNewPasswordObscurePressed = true;
bool _isConfirmPasswordObscurePressed = true;
ResetPassword resetPasswordArgs;

class _ResetPasswordState extends State<ResetPassword> {
  final resetPasswordFormKey = GlobalKey<FormState>();
  TextEditingController newPasswordController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    resetPasswordArgs = ModalRoute.of(context).settings.arguments;

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
              padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
              height: MediaQuery.of(context).size.height - 150,
              width: 327.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset("assets/icons/forgot_password.png", width: 200.0.w, height: 200.0.h,),
                  Spacer(flex: 16,),
                  Text("Reset Password", style: Font_Style().montserrat_ExtraBold(null, 24),),
                  Spacer(flex: 16,),
                  Text((resetPasswordArgs.rPSubTitle == null || resetPasswordArgs.rPSubTitle == "") ? "Change Password Here!" : resetPasswordArgs.rPSubTitle, style: Font_Style().montserrat_SemiBold(null, 16),),
                  Spacer(flex: 50,),
                  _textFieldWidget(context),
                  Spacer(flex: 80,),
                  _buttonWidget(context),
                  Spacer(flex: 160,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _textFieldWidget(BuildContext context) {
    return Container(
      height: 145.h,
      child: Form(
        key: resetPasswordFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (val){
                return val.length > 6 ? null : "New Password too short";
              },
              controller: newPasswordController,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: Font_Style().setLable(
                  "New Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isNewPasswordObscurePressed = !_isNewPasswordObscurePressed;
                        });
                      },
                      child: Icon(_isNewPasswordObscurePressed ? Icons.visibility_off : Icons.visibility, size: 18,)),context),
              cursorColor: Font_Style().secondaryColor,
              obscureText: _isNewPasswordObscurePressed,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 1,),
            TextFormField(
              validator: (val){
                return val.length > 6 ? ((newPasswordController.text == val) ? null : "New Password and Confirm Password don't match") : "Confirm Password too short";
              },
              controller: confirmPasswordController,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: Font_Style().setLable(
                  "Confirm Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isConfirmPasswordObscurePressed = !_isConfirmPasswordObscurePressed;
                        });
                      },
                      child: Icon(_isConfirmPasswordObscurePressed ? Icons.visibility_off : Icons.visibility, size: 18,)),context),
              cursorColor: Font_Style().secondaryColor,
              obscureText: _isConfirmPasswordObscurePressed,
              style:  Font_Style().textfield_style(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buttonWidget(BuildContext context) {
    return Container(
      child: InkWell(
        onTap: (){
          print("reset pass" + resetPasswordArgs.rPSubTitle);
          if(resetPasswordFormKey.currentState.validate()) {
            if(resetPasswordArgs.rPSubTitle == "") {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/location_bottom_sheet");
              print("lbs");
            }
            else if(resetPasswordArgs.rPSubTitle == "Forgot Password? Don't Worry") {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/login");
              print("l");
            }
            else if(resetPasswordArgs.rPSubTitle == "Change Password Here!") {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, "/bottom_nav");
              print("bn");
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
