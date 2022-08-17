import 'package:flutter/material.dart';
import 'package:food_delivery/widgets/big_text.dart';
import 'package:food_delivery/widgets/small_text.dart';

class PageFoodBody extends StatefulWidget {
  const PageFoodBody({Key? key}) : super(key: key);

  @override
  State<PageFoodBody> createState() => _PageFoodBodyState();
}

class _PageFoodBodyState extends State<PageFoodBody> {
  //viewportfraction shows side items in page view
  PageController pageCon = PageController(viewportFraction: 0.87);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
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
    return Padding(
        padding: const EdgeInsets.only(left: 5, right: 5, bottom: 10),
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
                  left: 30,
                  right: 30,
                ),
                child: Container(
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.white,
                  ),

                  //page view small item
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 16, right: 16, bottom: 15),
                    child: Container(
                      width: 230,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              BigText(
                                text: "Bitter Orange Marinade",
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            children: [
                              Row(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          size: 15,
                                        )),
                              ),
                              SmallText(
                                text: "4.5",
                                color: Colors.grey,
                              ),
                              SmallText(
                                text: "12887 comments",
                                color: Colors.grey,
                              )
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [Icon(Icons.star), Text("Normal")],
                              ),
                              Row(
                                children: [Icon(Icons.star), Text("Normal")],
                              ),
                              Row(
                                children: [Icon(Icons.star), Text("Normal")],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
