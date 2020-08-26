import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/otp_screens/get_otp.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

bool _isObscurePressed = true;

class _RegisterState extends State<Register> {
  final registerFormKey = GlobalKey<FormState>();
  TextEditingController registerName = new TextEditingController();
  TextEditingController registerEmail = new TextEditingController();
  TextEditingController registerPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Center(
            child: Container(
              padding: EdgeInsets.only(left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
              height: MediaQuery.of(context).size.height - 50,
              width: 327.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 40,),
                  Text(
                      "Create a New Account", textAlign: TextAlign.center,
                      style:  Font_Style().montserrat_Bold(null, 30)),
                  Spacer(flex: 22,),
                  Text("For the best experience with 1Elite", textAlign: TextAlign.center, style: Font_Style().montserrat_Regular(null, 18),),
                  Spacer(flex: 50,),
                  Text(
                      "Register",
                      style:  Font_Style().montserrat_Bold(null, 24)),
                  Spacer(flex: 5,),
                  Container(
                    width: 37.w,
                    height: 5.h,
                    decoration: BoxDecoration(
                        color: Font_Style().primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Spacer(flex: 55,),
                  _textFieldWidget(context),
                  Spacer(flex: 75,),
                  Center(child: _buttonWidget(context)),
                  Spacer(flex: 114,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account? ", textAlign: TextAlign.center, style: Font_Style().montserrat_medium(null, 12),),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, "/login");
                        },
                          child: Text("Login", textAlign: TextAlign.center, style: Font_Style().montserrat_Bold(null, 14),)),
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
      height: 210.h,
      child: Form(
        key: registerFormKey,
        child: Column(
          children: <Widget>[
            TextFormField(
                validator: (val){
                  return val.isEmpty || val.length < 4 ? "User Name must be atleast 4 characters long" : null;
                },
                controller: registerName,
                maxLength: 25,
                decoration:
                Font_Style().setLable("Name", null,context),
                keyboardType: TextInputType.text,
                cursorColor: Font_Style().secondaryColor,
                style:  Font_Style().textfield_style()),
            Spacer(flex: 1,),
            TextFormField(
              validator: (val){
                return EmailValidator.validate(val) && RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(val) ?
                null : "Enter valid email";
              },
              controller: registerEmail,
              maxLength: 35,
              decoration:
              Font_Style().setLable("Email Address", Icon(FontAwesomeIcons.check,size: 15,),context),
              keyboardType: TextInputType.emailAddress,
              cursorColor: Font_Style().secondaryColor,
              style:  Font_Style().textfield_style(),),
            Spacer(flex: 1,),
            TextFormField(
              validator: (val){
                return val.length > 6 ? null : "Password too short";
              },
              controller: registerPassword,
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
          if(registerFormKey.currentState.validate()) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => GetOtp(subTitle: "",)),
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
                "Register",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}