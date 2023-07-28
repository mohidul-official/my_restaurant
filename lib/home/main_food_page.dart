import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_restaurant/home/food_page_body.dart';
import 'package:my_restaurant/utils/colors.dart';
import 'package:my_restaurant/widgets/big_text.dart';
import 'package:my_restaurant/widgets/small_text.dart';

class MainFooPage extends StatefulWidget {
  const MainFooPage({super.key});

  @override
  State<MainFooPage> createState() => _MainFooPageState();
}

class _MainFooPageState extends State<MainFooPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              margin: EdgeInsets.only(top: 45, bottom: 15),
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      BigText(
                        text: "India",
                        color: AppColors.mainColor,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "WB",
                            color: Colors.black54,
                          ),
                          Icon(Icons.arrow_drop_down_rounded),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 45,
                      height: 45,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          FoodPageBody(),
        ],
      ),
    );
  }
}
