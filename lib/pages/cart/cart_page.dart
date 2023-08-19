import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_restaurant/controllers/cart_controller.dart';
import 'package:my_restaurant/controllers/popular_product_controller.dart';
import 'package:my_restaurant/controllers/recommended_product_controller.dart';
import 'package:my_restaurant/pages/home/main_food_page.dart';
import 'package:my_restaurant/routes/route_helper.dart';
import 'package:my_restaurant/utils/app_constants.dart';
import 'package:my_restaurant/utils/colors.dart';
import 'package:my_restaurant/utils/dimensions.dart';
import 'package:my_restaurant/widgets/app_icon.dart';
import 'package:my_restaurant/widgets/big_text.dart';
import 'package:my_restaurant/widgets/small_text.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: Dimesions.height20 * 3,
            left: Dimesions.height20,
            right: Dimesions.height20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.arrow_back_ios,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimesions.iconSize24,
                ),
                SizedBox(
                  width: Dimesions.height20 * 5,
                ),
                GestureDetector(
                  onTap: () {
                    //Get.to(() => MainFooPage());

                    Get.toNamed(RouteHelper.getInitial());
                  },
                  child: AppIcon(
                    icon: Icons.home_outlined,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    iconSize: Dimesions.iconSize24,
                  ),
                ),
                AppIcon(
                  icon: Icons.shopping_cart_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimesions.iconSize24,
                ),
              ],
            ),
          ),
          Positioned(
            top: Dimesions.height20 * 5,
            left: Dimesions.height20,
            right: Dimesions.height20,
            bottom: 0,
            child: Container(
              margin: EdgeInsets.only(top: Dimesions.height15),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartController>(
                  builder: (cartController) {
                    var _cartList = cartController.getItems;
                    return ListView.builder(
                        itemCount: _cartList.length,
                        itemBuilder: (_, index) {
                          return Container(
                            height: Dimesions.height20 * 5,
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    var popularIndex =
                                        Get.find<PopularProductController>()
                                            .popularProductList
                                            .indexOf(_cartList[index].product!);
                                    if (popularIndex >= 0) {
                                      Get.toNamed(RouteHelper.getPopularFood(
                                          popularIndex, "cartpage"));
                                    } else {
                                      var recommendedIndex = Get.find<
                                              RecommendedProductController>()
                                          .recommendedProductList
                                          .indexOf(_cartList[index].product!);
                                      Get.toNamed(
                                          RouteHelper.getRecommendedFood(
                                              recommendedIndex, "cartpage"));
                                    }
                                  },
                                  child: Container(
                                    width: Dimesions.height20 * 5,
                                    height: Dimesions.height20 * 5,
                                    margin: EdgeInsets.only(
                                        bottom: Dimesions.height10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            AppConstants.BASE_URL +
                                                AppConstants.UPLOAD_URL +
                                                _cartList[index].img!),
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          Dimesions.radius20),
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: Dimesions.height10,
                                ),
                                Expanded(
                                  child: Container(
                                    height: Dimesions.height20 * 5,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                          text: _cartList[index].name!,
                                          color: Colors.black54,
                                        ),
                                        SmallText(text: "Spicy"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text: "\$ " +
                                                  _cartList[index]
                                                      .price!
                                                      .toString(),
                                              color: Colors.redAccent,
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(
                                                top: Dimesions.height10,
                                                bottom: Dimesions.height10,
                                                right: Dimesions.height10,
                                                left: Dimesions.height10,
                                              ),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        Dimesions.radius20),
                                                color: Colors.white,
                                              ),
                                              child: Row(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          -1);
                                                    },
                                                    child: Icon(
                                                      Icons.remove,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width:
                                                        Dimesions.height10 / 2,
                                                  ),
                                                  BigText(
                                                      text: _cartList[index]
                                                          .quantity
                                                          .toString()), // popularProduct.inCartItems.toString()),
                                                  SizedBox(
                                                    width:
                                                        Dimesions.height10 / 2,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController.addItem(
                                                          _cartList[index]
                                                              .product!,
                                                          1);
                                                    },
                                                    child: Icon(
                                                      Icons.add,
                                                      color:
                                                          AppColors.signColor,
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                        });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GetBuilder<CartController>(
        builder: (cartController) {
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
                      SizedBox(
                        width: Dimesions.height10 / 2,
                      ),
                      BigText(
                          text: "\$ " + cartController.totalAmount.toString()),
                      SizedBox(
                        width: Dimesions.height10 / 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    //popularProduct.addItem(product);
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
                      text: "Check Out",
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
