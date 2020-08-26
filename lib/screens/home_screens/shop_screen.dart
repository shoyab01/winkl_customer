import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Center(child: Text("LOGO", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),)),
        title: Text("Shop Name", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(left: 22.0.w, right: 22.0.w, top: 10.0.h, bottom: 10.0.h),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: ListView.separated(
              separatorBuilder: (context, index) => Padding(
                padding: EdgeInsets.only(top: 1.0.h),
                child: Divider(
                  thickness: 0.5.h,
                  color: Font_Style().secondaryColorWithOpacity,
                ),
              ),
              physics: ClampingScrollPhysics(),
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: 10,
              itemBuilder: (context, i) {
                return _shopScreenItem();
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _shopScreenItem() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/item_screen");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0.h,),
        height: 120.0.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(right: 22.0.w),
                width: MediaQuery.of(context).size.width - 180.0.w,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Item Name",
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.clip,
                      style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 18),),
                    Text("₹240", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),),
                    Text(
                      "Description Description Description Description Description Description Description Description Description Description",
                      maxLines: 2,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      style: Font_Style().montserrat_medium(Font_Style().secondaryColor, 14),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/icons/barber_shop.png")
                    )
                )
            ),
          ],
        ),
      ),
    );
  }
}

