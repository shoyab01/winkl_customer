import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:winkl_customer/ThemeData/fontstyle.dart';

class ItemScreen extends StatefulWidget {
  @override
  _ItemScreenState createState() => _ItemScreenState();
}

List<int> _morePressedItems = [];
Map itemScreenAddedMap = {};

class _ItemScreenState extends State<ItemScreen> {
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
            child: Icon(Icons.arrow_back, color: Font_Style().secondaryColor, size: 24.0,)),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Icon(Icons.info, color: Font_Style().secondaryColor, size: 24.0,)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Icon(Icons.favorite_border, color: Font_Style().secondaryColor, size: 24.0,)),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0.w),
              child: Icon(Icons.search, color: Font_Style().secondaryColor, size: 24.0,)),
        ],
      ),
      body: SafeArea(
        child: Builder(
            builder: (BuildContext innerContext) {
              return Container(
                padding: EdgeInsets.only(left: 22.0.w, right: 22.0.w, top: 10.0.h, bottom: 10.0.h),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Item Name", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 22),),
                      SizedBox(height: 6.0.h,),
                      Text(
                        "Description Description Description Description Description Description Description Description Description Description",
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: Font_Style().montserrat_Light(Font_Style().secondaryColor, 14),
                      ),
                      SizedBox(height: 16.0.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(Icons.star, color: Font_Style().secondaryColor,size: 14.0,),
                              Text("3.9", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 16),),
                              Icon(Icons.arrow_forward_ios, color: Font_Style().secondaryColorWithOpacity, size: 14,),
                            ],
                          ),
                          Text("10:00 AM to 6:00 PM", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 16),),
                          Text("₹200", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 16),),
                        ],
                      ),
                      SizedBox(height: 16.0.h,),
                      Text("40% off up to ₹80 | Use code BIRTHDAY", style: Font_Style().montserrat_Light(Font_Style().secondaryColorWithOpacity, 12),),
                      Text("10% off up to ₹150 | Use code PARTY", style: Font_Style().montserrat_Light(Font_Style().secondaryColorWithOpacity, 12),),
                      SizedBox(height: 2.0.h,),
                      Text("view coupon details", style: Font_Style().montserrat_Regular(Colors.orangeAccent, 12),),
                      SizedBox(height: 24.0.h,),
                      Divider(
                        thickness: 1.0,
                        color: Font_Style().secondaryColorWithOpacity,
                      ),
                      SizedBox(height: 12.0.h,),
                      Text("Recommended", style: Font_Style().montserrat_Bold(Font_Style().secondaryColor, 22),),
                      SizedBox(height: 8.0.h,),
                      ListView.separated(
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
                          return _itemScreenItem(i, innerContext);
                        },
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }

  Widget _itemScreenItem(int index, BuildContext innerContext) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0.h,),
      height: _morePressedItems.contains(index) ? 150.0.h : 120.0.h,
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        width: 180.0.w,
                        child: Text(
                          "Description Description Description Description Description Description Description Description Description Description",
                          maxLines: _morePressedItems.contains(index) ? 4 : 2,
                          textAlign: TextAlign.left,
                          overflow: _morePressedItems.contains(index) ? null : TextOverflow.ellipsis,
                          style: Font_Style().montserrat_medium(Font_Style().secondaryColor, 14),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            _morePressedItems.add(index);
                          });
                        },
                          child: _morePressedItems.contains(index) ? Container() : Text("More", style: Font_Style().montserrat_SemiBold(Font_Style().secondaryColor, 12),)),
                    ],
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
                        child: itemScreenAddedMap.containsKey(index) && itemScreenAddedMap[index] > 0 ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if(itemScreenAddedMap.containsKey(index)) {
                                      if(itemScreenAddedMap[index] > 0) {
                                        itemScreenAddedMap[index] -= 1;
                                      }
                                    }
                                  });
                                  print(itemScreenAddedMap);
                                  showSnackBar(innerContext);
                                },
                                child: Text("-", style: Font_Style().montserrat_SemiBold(Colors.grey, 24),)),
                            Text(itemScreenAddedMap[index].toString(), style: Font_Style().montserrat_SemiBold(Colors.green, 12),),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    if(itemScreenAddedMap.containsKey(index)) {
                                      itemScreenAddedMap[index] += 1;
                                    }
                                  });
                                  print(itemScreenAddedMap);
                                  showSnackBar(innerContext);
                                },
                                child: Text("+", style: Font_Style().montserrat_SemiBold(Colors.green, 18),)),
                          ],
                        ) : InkWell(
                            onTap: () {
                              setState(() {
                                if(!itemScreenAddedMap.containsKey(index)) {
                                  itemScreenAddedMap.putIfAbsent(index, () => 1);
                                }
                                else {
                                  itemScreenAddedMap[index] += 1;
                                }
                              });
                              print(itemScreenAddedMap);
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
                    Text(((itemScreenAddedMap.values.reduce((sum, element) => sum + element) == 1) ? "1 Item" : "${itemScreenAddedMap.values.reduce((sum, element) => sum + element)} Items") + " | Rs ${itemScreenAddedMap.values.reduce((sum, element) => sum + element) * 50}", style: Font_Style().montserrat_Bold(Colors.white, 14),),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        //////////////////////////////////////
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
