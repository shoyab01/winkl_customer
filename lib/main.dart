import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:winkl_customer/screens/components/bottom_nav.dart';
import 'package:winkl_customer/screens/forget_change_password/reset_password.dart';
import 'package:winkl_customer/screens/home_screens/item_screen.dart';
import 'package:winkl_customer/screens/home_screens/shop_screen.dart';
import 'package:winkl_customer/screens/login_register/login.dart';
import 'package:winkl_customer/screens/login_register/register.dart';
import 'package:winkl_customer/screens/otp_screens/get_otp.dart';
import 'package:winkl_customer/screens/otp_screens/verify_otp.dart';
import 'package:winkl_customer/screens/profile_screens/customer_care.dart';
import 'package:winkl_customer/screens/profile_screens/feedback_suggestion.dart';
import 'package:winkl_customer/screens/welcome.dart';
import 'ThemeData/fontstyle.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Winkl Customer',
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Font_Style().primaryColor,
          cursorColor: Font_Style().primaryColor),
      routes: {
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/register':(context) => Register(),
        '/verify_otp': (context) => VerifyOtp(),
        '/reset_password': (context) => ResetPassword(),
        '/get_otp': (context) => GetOtp(),
        '/verify_otp': (context) => VerifyOtp(),
        '/bottom_nav': (context) => BottomNav(),
        '/shop_screen': (context) => ShopScreen(),
        '/item_screen': (context) => ItemScreen(),
        '/customer_care': (context) => CustomerCare(),
        '/feedback_suggestion': (context) => FeedBackSuggestion(),
      },
      initialRoute: '/',
    );
  }

}