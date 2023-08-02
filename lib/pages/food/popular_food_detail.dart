import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_restaurant/utils/colors.dart';
import 'package:my_restaurant/utils/dimensions.dart';
import 'package:my_restaurant/widgets/app_icon.dart';
import 'package:my_restaurant/widgets/big_text.dart';
import 'package:my_restaurant/widgets/icon_and_text_widget.dart';
import 'package:my_restaurant/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  const PopularFoodDetail({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(0, 0, 0, 0.055)
            //color set to transperent or set your own color
            ));
    return Scaffold(
      body: Stack(
        children: [
          //backgroud image
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.maxFinite,
              height: Dimesions.popularFoodImgSize,
              decoration: BoxDecoration(
                  image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/pizza.jpg"),
              )),
            ),
          ),
          //back and cart icon
          Positioned(
            top: Dimesions.height45,
            left: Dimesions.height20,
            right: Dimesions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.arrow_back_ios),
                AppIcon(icon: Icons.shopping_cart_outlined),
              ],
            ),
          ),
          //details section
          Positioned(
            left: 0,
            right: 0,
            top: Dimesions.popularFoodImgSize,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimesions.height20,
                  right: Dimesions.height20,
                  top: Dimesions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimesions.radius20),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Chinese Side"),
                  SizedBox(
                    height: Dimesions.height10,
                  ),
                  Row(
                    children: [
                      Wrap(
                        children: List.generate(
                          5,
                          (index) => Icon(
                            Icons.star,
                            color: AppColors.mainColor,
                            size: Dimesions.height15,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Dimesions.height10,
                      ),
                      SmallText(text: "4.5"),
                      SizedBox(
                        width: Dimesions.height10,
                      ),
                      SmallText(text: "1287"),
                      SizedBox(
                        width: Dimesions.height10,
                      ),
                      SmallText(text: "comments")
                    ],
                  ),
                  SizedBox(
                    height: Dimesions.height20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconAndTextWidget(
                        icon: Icons.circle_sharp,
                        text: "Normal",
                        iconColor: AppColors.iconColor1,
                      ),
                      IconAndTextWidget(
                        icon: Icons.location_on,
                        text: "1.7km",
                        iconColor: AppColors.mainColor,
                      ),
                      IconAndTextWidget(
                        icon: Icons.access_time_rounded,
                        text: "32min",
                        iconColor: AppColors.iconColor2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
