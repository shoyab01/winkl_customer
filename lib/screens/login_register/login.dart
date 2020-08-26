import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/components/bottom_nav.dart';
import 'package:winkl_customer/screens/otp_screens/get_otp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

bool _isObscurePressed = true;

class _LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  TextEditingController loginEmail = new TextEditingController();
  TextEditingController loginPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
              height: MediaQuery.of(context).size.height - 80,
              width: 327.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 50,),
                  Text("Welcome back!", textAlign: TextAlign.center, style: Font_Style().montserrat_Bold(null, 32),),
                  Spacer(flex: 10,),
                  Text("Login now to Continue", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(null, 14),),
                  Spacer(flex: 67,),
                  Text("Login", style: Font_Style().montserrat_Bold(null, 24),),
                  Spacer(flex: 10,),
                  Container(
                    width: 37.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Font_Style().primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Spacer(flex: 50,),
                  _textFieldWidget(context),
                  Spacer(flex: 20,),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          //Navigator.pushNamed(context, "/get_otp", arguments: GetOtp(subTitle: "Forgot Password? Don't Worry",));
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => GetOtp(subTitle: "Forgot Password? Don't Worry",)),
                          );
                        },
                          child: Text("Forgot Password?", style: Font_Style().montserrat_medium(null, 12),))),
                  Spacer(flex: 50,),
                  Center(child: _buttonWidget(context)),
                  Spacer(flex: 30,),
                  Center(
                    child: Text("or Login with", textAlign: TextAlign.center, style: Font_Style().montserrat_SemiBold(null, 11),),
                  ),
                  Spacer(flex: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      InkWell(
                        onTap: (){
                          /////////////////////////////////////
                        },
                        child: Container(
                          width: 56.h,
                          height: 56.h,
                          padding: EdgeInsets.all(14.h),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45, blurRadius: 3)
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Image.asset("assets/icons/google.png", width: 28.0.w, height: 28.0.h,),
                        ),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        onTap: () {
                          ///////////////////////////////////////
                        },
                        child: Container(
                          width: 56.h,
                          height: 56.h,
                          padding: EdgeInsets.only(
                              left: 10.h,
                              right: 18.h,
                              top: 14.h,
                              bottom: 14.h),
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black45, blurRadius: 3)
                              ],
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white),
                          child: Container(
                              child: Image.asset("assets/icons/facebook.png", height: 28.0.h, width: 28.0.w,)),
                        ),
                      ),
                    ],
                  ),
                  Spacer(flex: 121,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Don't have an account? ", textAlign: TextAlign.center, style: Font_Style().montserrat_medium(null, 12),),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/register");
                        },
                          child: Text("Register", textAlign: TextAlign.center, style: Font_Style().montserrat_Bold(null, 14),)),
                    ],
                  ),
                  Spacer(flex: 32,),
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
        key: loginFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              validator: (val){
                return EmailValidator.validate(val) && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                null : "Please enter a valid email";
              },
              controller: loginEmail,
              maxLength: 35,
              decoration:
              Font_Style().setLable("Email Address", Icon(FontAwesomeIcons.check,size: 15,),context),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Font_Style().secondaryColor,
              style:  Font_Style().textfield_style(),
            ),
            Spacer(flex: 1,),
            TextFormField(
              validator: (val){
                return val.length > 6 ? null : "Password too short";
              },
              controller: loginPassword,
              maxLength: 25,
              keyboardType: TextInputType.text,
              decoration: Font_Style().setLable(
                  "Password",
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscurePressed = !_isObscurePressed;
                        });
                      },
                      child: Icon(_isObscurePressed ? Icons.visibility_off : Icons.visibility, size: 18,)),context),
              cursorColor: Font_Style().secondaryColor,
              obscureText: _isObscurePressed,
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
          if(loginFormKey.currentState.validate()) {
            //Navigator.pushNamed(context, "/get_otp", arguments: GetOtp(subTitle: "",));
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BottomNav(currentIndex: 0,)),
            );
          }
        },
        child: Container(
          width: 234.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(30)),
          height: 48.h,
          child: Center(
            child: Text(
                "Login",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}
