import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class FeedBackSuggestion extends StatefulWidget {
  @override
  _FeedBackSuggestionState createState() => _FeedBackSuggestionState();
}

class _FeedBackSuggestionState extends State<FeedBackSuggestion> {
  bool _showPrefix = true;
  String _counterText = "0";
  FocusNode focusNode = FocusNode();
  TextEditingController give_us_feedback_controller;
  bool give_us_feedback_IsEmpty = false;
  final feedBackFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    focusNode.addListener(() {
      if(focusNode.hasFocus) {
        setState(() {
          _showPrefix = false;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(Icons.arrow_back, size: 24.0, color: Font_Style().secondaryColor,)),
        title: Text("Feedback & suggestion", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),),
      ),
      body: SafeArea(
        child: Center(
          child: KeyboardAvoider(
            autoScroll: true,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 100.0.h,
              padding: EdgeInsets.only(left: 24.0.w, right: 24.0.w, bottom: 10.0.h, top: 10.0.h),
              child: Column(
                children: <Widget>[
                  Flexible(
                    flex: 200,
                    child: Stack(
                      children: <Widget>[
                        Container(
                          height: 200.0.h,
                          width: 327.0.w,
                          child: Form(
                            key: feedBackFormKey,
                            child: TextFormField(
                              validator: (val){
                                return val.length == 0 ? "Feedback can't be empty" : (val.length < 16 ? "Please provide a detailed feedback" : null);
                              },
                              controller: give_us_feedback_controller,
                              focusNode: focusNode,
                              onChanged: (text) {
                                _counterText = text.length.toString();
                                setState(() {
                                  focusNode.addListener(() {
                                    if (text.length == 500) {}
                                    if (text.isEmpty) {
                                      if(focusNode.hasFocus) {
                                        _showPrefix = false;
                                      }
                                      else{
                                        _showPrefix = true;
                                      }
                                    }
                                    else {
                                      _showPrefix = false;
                                    }
                                  });
                                });
                              },
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(500),
                              ],
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              expands: true,
                              textInputAction: TextInputAction.newline,
                              textAlignVertical: TextAlignVertical.top,
                              cursorColor: Font_Style().secondaryColor,
                              style: Font_Style().montserrat_Light(Font_Style().secondaryColor, 16),
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 12.w,top: 12.h,bottom:30.h,right: 12.w),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0),
                                      bottomRight: Radius.circular(15.0),
                                      bottomLeft: Radius.circular(15.0)),
                                  borderSide: BorderSide(
                                    color: Colors.grey, //#070920
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: give_us_feedback_IsEmpty ? Colors.red : Colors.grey, //#070920
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: give_us_feedback_IsEmpty ? Colors.red : Colors.grey, //#070920
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 12.w,
                          top: 12.h,
                          child: Row(
                            children: <Widget>[
                              _showPrefix
                                  ? Icon(Icons.edit, color: Font_Style().secondaryColor,)
                                  : Icon(null,),
                              SizedBox(width: 10.w,),
                              _showPrefix ? Text("Write your feedback here", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),) : Text(""),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                Spacer(flex: 10,),
                Align(
                  alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 12.0.w),
                        child: Text(_counterText + "/500", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),))),
                  Spacer(flex: 70,),
                  _buttonWidget(context),
                  Spacer(flex: 60,),
                  Image.asset("assets/icons/artboarddr@2x.png", width: 312.0.w, height: 234.0.h,),
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
          if(feedBackFormKey.currentState.validate()) {
            /////////////////
          }
        },
        child: Container(
          width: 234.w,
          decoration: BoxDecoration(
              color: Font_Style().primaryColor, borderRadius: BorderRadius.circular(30)),
          height: 48.h,
          child: Center(
            child: Text(
                "Submit",
                style: Font_Style().montserrat_Bold(Colors.white, 19)
            ),
          ),
        ),
      ),
    );
  }
}