import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: Center(child: Text("LOGO", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),)),
        title: Row(
          children: <Widget>[
            Text("New Place", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),),
            Icon(Icons.location_on, size: 24.0, color: Font_Style().secondaryColor,),
          ],
        ),
        actions: <Widget>[
          Row(
            children: <Widget>[
              Icon(Icons.local_offer, size: 24.0, color: Font_Style().secondaryColor,),
              Center(child: Text("Offers", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 18),)),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h, left: 20.0.w, right: 20.0.w),
          child: Column(
            children: <Widget>[
              Container(
                height: 250.0.h,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      ListView.builder(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, i) {
                          return _imageCard();
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8.0.h,),
              Align(
                alignment: Alignment.centerLeft,
                  child: Text("All Shops", style: Font_Style().montserrat_Bold(Font_Style().primaryColor, 16),)),
              SizedBox(height: 12.0.h,),
              Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ListView.separated(
                      separatorBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(top: 2.0.h),
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
                        return _homeListItem();
                      },
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeListItem() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/shop_screen");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0.h,),
        height: 120.0.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
                width: 80.0,
                height: 80.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage("assets/icons/barber_shop.png")
                    )
                )
            ),
            Container(
              width: MediaQuery.of(context).size.width - 130.0.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Shop Name",
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.clip,
                    style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 16),),
                  Text(
                    "Bhavana colony, Center point, Bowenpally, 1-28-44/A, Plot no 103, Secunderabad, Telangana 500011",
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                    style: Font_Style().montserrat_medium(Font_Style().secondaryColor, 12),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("4.2", style: Font_Style().montserrat_medium(Font_Style().secondaryColor, 14),),
                      RatingBar(
                        initialRating: 4.2,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemSize: 14.0,
                        itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          size: 1.0,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                      Text("(15)", style: Font_Style().montserrat_medium(Font_Style().secondaryColor, 14),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text("39 mins", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 14),),
                      Spacer(),
                      Icon(Icons.directions, size: 16.0.h, color: Font_Style().secondaryColor,),
                      SizedBox(width: 8.0.w,),
                      Text("5.0 KM", style: Font_Style().montserrat_Regular(Font_Style().secondaryColor, 14),),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _imageCard() {
    return Container(
      height: 250.0.h,
      width: 300.0.h,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Text("Hair Cut", style: Font_Style().montserrat_SemiBold(null, 14),),
            Image.asset("assets/icons/hair_cut.png", fit: BoxFit.cover,),
          ],
        ),
      ),
    );
  }
}
