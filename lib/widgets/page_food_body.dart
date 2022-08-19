import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/icons_and_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PageFoodBody extends StatefulWidget {
  const PageFoodBody({Key? key}) : super(key: key);

  @override
  State<PageFoodBody> createState() => _PageFoodBodyState();
}

class _PageFoodBodyState extends State<PageFoodBody> {
  double scaleFactor = 0.8;

  //viewportfraction shows side items in page view
  PageController pageCon = PageController(viewportFraction: 0.87);

  // pagevalue is not the same as pageindex
  // pagevalue counts by decimal numbers
  double _currPageVal = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageCon.addListener(() {
      setState(() {
        _currPageVal = pageCon.page!;
      });
      print("Current Page value is ${_currPageVal.toString()} ");
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageCon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      margin: EdgeInsets.only(left: 5, right: 5),
      height: 320,
      child: PageView.builder(
          controller: pageCon,
          itemCount: 5,
          itemBuilder: (context, position) {
            return PageFoodItem(position);
          }),
    );
  }

  Widget PageFoodItem(int index) {
    Matrix4 matrix = Matrix4.identity();
    if (index == _currPageVal.floor()) {
      // var currscale = 1 - (_currPageVal - index) * (1 - scaleFactor);
      var currscale = 1.0;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
    } else if (index == _currPageVal.floor() - 1) {
      // var currscale = scaleFactor + (1 - _currPageVal )
      var currscale = scaleFactor;
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
    }
    //for next page
    else if (index == _currPageVal.floor() + 1) {
      var currscale =
          scaleFactor + (_currPageVal - index + 1) * (1 - scaleFactor);
      matrix = Matrix4.diagonal3Values(1, currscale, 1);
    }

    return Transform(
      transform: matrix,
      child: Padding(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 30),
        child: Stack(
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: index.isEven ? Color(0xFFffd28d) : Color(0xFFa9a29f),
                  image: DecorationImage(
                      image: AssetImage("assets/image/food0.png"),
                      fit: BoxFit.cover)),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: 10,
                ),
                child: Container(
                    height: 110,
                    width: 470,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),

                    //page view small item
                    child: Padding(
                      padding:
                          const EdgeInsets.only(top: 13, left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: "Chinese Side",
                            size: 20,
                            color: AppColors.titleColor,
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: AppColors.mainColor,
                                          size: 16,
                                        )),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              SmallText(
                                text: "4.5",
                                size: 14,
                                color: AppColors.signColor,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              SmallText(
                                text: "2335",
                                size: 14,
                                color: AppColors.signColor,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              SmallText(
                                text: "comments",
                                size: 14,
                                color: AppColors.signColor,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon_and_Text_Widget(
                                  icon: Icons.circle_sharp,
                                  color: AppColors.signColor,
                                  iconColor: AppColors.yellowColor,
                                  text: "Normal"),
                              SizedBox(
                                width: 5,
                              ),
                              Icon_and_Text_Widget(
                                  icon: Icons.location_on,
                                  color: AppColors.signColor,
                                  iconColor: AppColors.mainColor,
                                  text: "1.7km"),
                              SizedBox(
                                width: 5,
                              ),
                              Icon_and_Text_Widget(
                                  icon: Icons.access_time_rounded,
                                  color: AppColors.signColor,
                                  iconColor: AppColors.iconColor2,
                                  text: "32mins"),
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
