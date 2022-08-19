import 'package:flutter/material.dart';
import 'package:food_delivery/utils/colors.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/page_food_body.dart';
import 'package:food_delivery/widgets/small_text.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 45, bottom: 15),
            padding: EdgeInsets.only(right: 20, left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    BigText(
                      text: 'Myanmar',
                      color: AppColors.mainColor, 
                      size: 20,
                    ),
                    Row(
                      children: [
                        SmallText(
                          text: 'Select Country',
                          color: AppColors.paraColor,
                          size: 12,
                        ),
                        Icon(Icons.arrow_drop_down_rounded),
                      ],
                    )
                  ],
                ),
                Container(
                  width: 45,
                  height: 45,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                )
              ],
            ),
          ),
          PageFoodBody(),
        ],
      ),
    );
  }
}


// 1:04:02 part 1