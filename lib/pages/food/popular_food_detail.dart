import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_restaurant/controllers/cart_controller.dart';
import 'package:my_restaurant/controllers/popular_product_controller.dart';
import 'package:my_restaurant/pages/home/main_food_page.dart';
import 'package:my_restaurant/routes/route_helper.dart';
import 'package:my_restaurant/utils/app_constants.dart';
import 'package:my_restaurant/utils/colors.dart';
import 'package:my_restaurant/utils/dimensions.dart';
import 'package:my_restaurant/widgets/app_column.dart';
import 'package:my_restaurant/widgets/app_icon.dart';
import 'package:my_restaurant/widgets/big_text.dart';
import 'package:my_restaurant/widgets/expendable_text_widget.dart';
import 'package:my_restaurant/widgets/icon_and_text_widget.dart';
import 'package:my_restaurant/widgets/small_text.dart';

class PopularFoodDetail extends StatelessWidget {
  final int pageId;
  const PopularFoodDetail({super.key, required this.pageId});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<PopularProductController>().popularProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color.fromRGBO(0, 0, 0, 0.055)
            //color set to transperent or set your own color
            ));
    return Scaffold(
      backgroundColor: Colors.white,
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
                image: NetworkImage(AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    product.img!),
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
                GestureDetector(
                  onTap: () {
                    //Get.back();
                    Get.toNamed(RouteHelper.getInitial());
                    //Get.to(() => MainFooPage());
                  },
                  child: AppIcon(icon: Icons.arrow_back_ios),
                ),
                GetBuilder<PopularProductController>(builder: (controller) {
                  return Stack(
                    children: [
                      AppIcon(icon: Icons.shopping_cart_outlined),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 0,
                              top: 0,
                              child: AppIcon(
                                icon: Icons.circle,
                                size: 20,
                                iconColor: Colors.transparent,
                                backgroundColor: AppColors.mainColor,
                              ),
                            )
                          : Container(),
                      Get.find<PopularProductController>().totalItems >= 1
                          ? Positioned(
                              right: 6,
                              top: 4,
                              child: BigText(
                                text: Get.find<PopularProductController>()
                                    .totalItems
                                    .toString(),
                                size: 12,
                                color: Colors.white,
                              ),
                            )
                          : Container(),
                    ],
                  );
                }),
              ],
            ),
          ),
          //details section
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimesions.popularFoodImgSize - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimesions.height20,
                  right: Dimesions.height20,
                  top: Dimesions.height20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(Dimesions.radius20),
                  topLeft: Radius.circular(Dimesions.radius20),
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppColumn(
                    text: product.name!,
                  ),
                  SizedBox(
                    height: Dimesions.height20,
                  ),
                  BigText(text: "Introduce"),
                  SizedBox(
                    height: Dimesions.height20,
                  ),
                  //Expendable Text section
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpendableTextWidget(text: product.description!),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<PopularProductController>(
        builder: (popularProduct) {
          return Container(
            height: Dimesions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimesions.height30,
                bottom: Dimesions.height30,
                right: Dimesions.height20,
                left: Dimesions.height20),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgrounColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimesions.radius20 * 2),
                topRight: Radius.circular(Dimesions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: Dimesions.height20,
                    bottom: Dimesions.height20,
                    right: Dimesions.height20,
                    left: Dimesions.height20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimesions.radius20),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: AppColors.signColor,
                        ),
                      ),
                      SizedBox(
                        width: Dimesions.height10 / 2,
                      ),
                      BigText(text: popularProduct.inCartItems.toString()),
                      SizedBox(
                        width: Dimesions.height10 / 2,
                      ),
                      GestureDetector(
                        onTap: () {
                          popularProduct.setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: AppColors.signColor,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    popularProduct.addItem(product);
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                      top: Dimesions.height20,
                      bottom: Dimesions.height20,
                      right: Dimesions.height20,
                      left: Dimesions.height20,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        Dimesions.radius20,
                      ),
                      color: AppColors.mainColor,
                    ),
                    child: BigText(
                      text: "\$ ${product.price!} | Add To Cart",
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
