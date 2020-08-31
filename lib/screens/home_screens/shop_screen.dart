import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';
import 'package:winkl_customer/screens/home_screens/checkout.dart';

class ShopScreen extends StatefulWidget {
  @override
  _ShopScreenState createState() => _ShopScreenState();
}

Map shopScreenAddedMap = {};

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
        child: Builder(
            builder: (BuildContext innerContext) {
              return Container(
                padding: EdgeInsets.only(
                    left: 22.0.w, right: 22.0.w, top: 10.0.h, bottom: 10.0.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListView.separated(
                    separatorBuilder: (context, index) =>
                        Padding(
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
                      return _shopScreenItem(i, innerContext);
                    },
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  Widget _shopScreenItem(int index, BuildContext innerContext) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, "/item_screen");
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5.0.h,),
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
              height: 110.0.h,
              width: 110.0.w,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                        width: 110.0.w,
                        height: 75.0.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            image: DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage("assets/icons/barber_shop.png")
                            )
                        )
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.white70, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      elevation: 5.0,
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 0.0.w, horizontal: 7.0.w),
                        height: 28.0.h,
                        width: 63.0.w,
                        child: Center(
                          child: shopScreenAddedMap.containsKey(index) && shopScreenAddedMap[index] > 0 ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if(shopScreenAddedMap.containsKey(index)) {
                                      if(shopScreenAddedMap[index] > 0) {
                                        shopScreenAddedMap[index] -= 1;
                                      }
                                    }
                                  });
                                  print(shopScreenAddedMap);
                                  showSnackBar(innerContext);
                                },
                                  child: Text("-", style: Font_Style().montserrat_SemiBold(Colors.grey, 24),)),
                              Text(shopScreenAddedMap[index].toString(), style: Font_Style().montserrat_SemiBold(Colors.green, 12),),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if(shopScreenAddedMap.containsKey(index)) {
                                      shopScreenAddedMap[index] += 1;
                                    }
                                  });
                                  print(shopScreenAddedMap);
                                  showSnackBar(innerContext);
                                },
                                  child: Text("+", style: Font_Style().montserrat_SemiBold(Colors.green, 18),)),
                            ],
                          ) : InkWell(
                            onTap: () {
                              setState(() {
                                if(!shopScreenAddedMap.containsKey(index)) {
                                  shopScreenAddedMap.putIfAbsent(index, () => 1);
                                }
                                else {
                                  shopScreenAddedMap[index] += 1;
                                }
                              });
                              print(shopScreenAddedMap);
                              showSnackBar(innerContext);
                            },
                              child: Text("ADD", style: Font_Style().montserrat_Bold(Colors.green, 14),)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackBar(context) {
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(SnackBar(
      duration: Duration(hours: 24),
      backgroundColor: Font_Style().primaryColor,
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onVerticalDragStart: (_) => debugPrint("no can do!"),
            child: Container(
              height: 47.0.h,
              width: 390.0.w,
              child: Row(
                children: <Widget>[
                  Text(((shopScreenAddedMap.values.reduce((sum, element) => sum + element) == 1) ? "1 Item" : "${shopScreenAddedMap.values.reduce((sum, element) => sum + element)} Items") + " | Rs ${shopScreenAddedMap.values.reduce((sum, element) => sum + element) * 50}", style: Font_Style().montserrat_Bold(Colors.white, 14),),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Checkout()),
                      );
                    },
                    child: Row(
                      children: <Widget>[
                        Text("Checkout", style: Font_Style().montserrat_Bold(Colors.white, 14),),
                        SizedBox(width: 5.0.w,),
                        Icon(Icons.arrow_forward,size: 19, color: Colors.white,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    ),
    )
    );
  }
}