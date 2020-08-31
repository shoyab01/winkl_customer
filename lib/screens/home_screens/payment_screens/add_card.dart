import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class AddCard extends StatefulWidget {
  @override
  _AddCardState createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final addCardFormKey = GlobalKey<FormState>();
  TextEditingController holderNameController = new TextEditingController();
  TextEditingController cardNumberController = new TextEditingController();
  TextEditingController validUptoController = new TextEditingController();
  TextEditingController cvvController = new TextEditingController();

  bool checkedValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
            child: Icon(Icons.arrow_back, size: 24.0, color: Font_Style().secondaryColor,)),
        title: Text("Add Your Card here", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 16),),
      ),
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            height: MediaQuery.of(context).size.height - 120.0.h,
            padding: EdgeInsets.only(left: 22.0.w, right: 22.0.w, top: 10.0.h, bottom: 10.0.h),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Enter card Details :", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 15),)),
                Spacer(flex: 23,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Image.asset("assets/icons/visa-and-mastercard-logo.png", height: 18.0.h, width: 71.0.w,),
                    SizedBox(width: 5.0.w,),
                    Image.asset("assets/icons/RuPay-Logo.png", height: 20.0.h, width: 58.0.w,),
                  ],
                ),
                Spacer(flex: 30,),
                Container(
                  height: 260.0.h,
                  child: Form(
                    key: addCardFormKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (val){
                            return val.length <= 4 ? "Please Enter a valid Card Number" : null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            hintText: "Enter the name on card",
                            hintStyle: Font_Style().montserrat_Regular(Font_Style().secondaryColorWithOpacity, 12),
                            labelText: "Holder Name",
                            labelStyle: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),
                            suffixIcon: Icon(Icons.perm_identity, size: 24, color: Font_Style().secondaryColorWithOpacity,),
                            counterText: "",
                          ),
                          maxLength: 35,
                          controller: holderNameController,
                          keyboardType: TextInputType.text,
                          cursorColor: Font_Style().secondaryColor,
                          style:  Font_Style().textfield_style(),
                        ),
                        Spacer(),
                        TextFormField(
                          inputFormatters: [
                            WhitelistingTextInputFormatter.digitsOnly,
                            new LengthLimitingTextInputFormatter(19),
                            new CardNumberInputFormatter()
                          ],
                          validator: (val){
                            return val.length < 22 ? "Please Enter a valid Card Number" : null;
                          },
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                            ),
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            hintText: "XXXX XXXX XXXX XXXX",
                            hintStyle: Font_Style().montserrat_Regular(Font_Style().secondaryColorWithOpacity, 12),
                            labelText: "Card Number",
                            labelStyle: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),
                            suffixIcon: Icon(Icons.dialpad, size: 24, color: Font_Style().secondaryColorWithOpacity,),
                            counterText: "",
                          ),
                          maxLength: 22,
                          controller: cardNumberController,
                          keyboardType: TextInputType.number,
                          cursorColor: Font_Style().secondaryColor,
                          style:  Font_Style().textfield_style(),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              width: 151.0.w,
                              child: TextFormField(
                                inputFormatters: [
                                  WhitelistingTextInputFormatter.digitsOnly,
                                  new LengthLimitingTextInputFormatter(4),
                                  new CardMonthInputFormatter()
                                ],
                                validator: (val){
                                  return val.length < 5 ? "Please Enter a valid Expiry Date" : null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  floatingLabelBehavior:FloatingLabelBehavior.always,
                                  hintText: "MM/YY",
                                  hintStyle: Font_Style().montserrat_Regular(Font_Style().secondaryColorWithOpacity, 12),
                                  labelText: "Valid Upto",
                                  labelStyle: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),
                                  suffixIcon: Icon(Icons.calendar_today, size: 24, color: Font_Style().secondaryColorWithOpacity,),
                                  counterText: "",
                                ),
                                maxLength: 5,
                                controller: validUptoController,
                                keyboardType: TextInputType.number,
                                cursorColor: Font_Style().secondaryColor,
                                style:  Font_Style().textfield_style(),
                              ),
                            ),
                            Container(
                              width: 151.0.w,
                              child: TextFormField(
                                validator: (val){
                                  return val.length < 3 ? "Please Enter a valid CVV" : null;
                                },
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red, width: 1.0),
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Font_Style().secondaryColorWithOpacity, width: 1.0),
                                  ),
                                  floatingLabelBehavior:FloatingLabelBehavior.always,
                                  hintText: "XXX",
                                  hintStyle: Font_Style().montserrat_Regular(Font_Style().secondaryColorWithOpacity, 12),
                                  labelText: "CVV",
                                  labelStyle: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),
                                  suffixIcon: Icon(Icons.help_outline, size: 24, color: Font_Style().secondaryColorWithOpacity,),
                                  counterText: "",
                                ),
                                maxLength: 3,
                                obscureText: true,
                                controller: cvvController,
                                keyboardType: TextInputType.number,
                                cursorColor: Font_Style().secondaryColor,
                                style:  Font_Style().textfield_style(),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(flex: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Checkbox(
                      value: checkedValue,
                      onChanged: (val) {
                        setState(() {
                          checkedValue = val;
                        });
                      },
                      activeColor: Font_Style().primaryColor,
                      checkColor: Colors.white,
                    ),
                    Text("Save Card Details", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16.0.w),
                        child: Text("We use secure gateway for your payment!", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 10),))),
                Spacer(flex: 270,),
                _buttonWidget(context),
                Spacer(flex: 30,),
              ],
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
          if(addCardFormKey.currentState.validate()) {
            Navigator.pushNamed(context, "/track_order");
          }
        },
        child: Container(
          width: 324.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(10)),
          height: 49.h,
          child: Center(
            child: Text(
                "Proceed",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}

class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != text.length) {
        buffer.write('/');
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}

