import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_restaurant/controllers/cart_controller.dart';
import 'package:my_restaurant/controllers/popular_product_controller.dart';
import 'package:my_restaurant/controllers/recommended_product_controller.dart';
import 'package:my_restaurant/pages/cart/cart_page.dart';
import 'package:my_restaurant/routes/route_helper.dart';
import 'package:my_restaurant/utils/app_constants.dart';
import 'package:my_restaurant/utils/colors.dart';
import 'package:my_restaurant/utils/dimensions.dart';
import 'package:my_restaurant/widgets/app_icon.dart';
import 'package:my_restaurant/widgets/big_text.dart';
import 'package:my_restaurant/widgets/expendable_text_widget.dart';

class RecommendedFoodDetails extends StatelessWidget {
  final int pageId;
  final String page;
  const RecommendedFoodDetails(
      {super.key, required this.pageId, required this.page});

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductController>().recommendedProductList[pageId];
    Get.find<PopularProductController>()
        .initProduct(product, Get.find<CartController>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              toolbarHeight: 70,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (page == "cartpage") {
                          Get.toNamed(RouteHelper.getCartPage());
                        } else {
                          //Get.back();
                          Get.toNamed(RouteHelper.getInitial());
                          //Get.to(() => MainFooPage());
                        }
                      },
                      child: AppIcon(icon: Icons.clear)),
                  GetBuilder<PopularProductController>(builder: (controller) {
                    return GestureDetector(
                      onTap: () {
                        if (controller.totalItems >= 1)
                          Get.toNamed(RouteHelper.getCartPage());
                        //Get.to(() => CartPage());
                      },
                      child: Stack(
                        children: [
                          AppIcon(icon: Icons.shopping_cart_outlined),
                          controller.totalItems >= 1
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
                      ),
                    );
                  }),
                ],
              ),
              bottom: PreferredSize(
                child: Container(
                  child: Center(
                    child: BigText(
                      text: product.name!,
                      size: Dimesions.font26,
                    ),
                  ),
                  width: double.maxFinite,
                  padding: EdgeInsets.only(
                    top: 5,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimesions.radius20),
                        topRight: Radius.circular(Dimesions.radius20),
                      )),
                ),
                preferredSize: Size.fromHeight(20),
              ),
              pinned: true,
              backgroundColor: AppColors.yellowColor,
              expandedHeight: 300,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  AppConstants.BASE_URL +
                      AppConstants.UPLOAD_URL +
                      product.img!,
                  width: double.maxFinite,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left: Dimesions.height20,
                        right: Dimesions.height20,
                      ),
                      child: ExpendableTextWidget(
                        text: product.description!,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: GetBuilder<PopularProductController>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: Dimesions.height20 * 2.5,
                      top: Dimesions.height10,
                      bottom: Dimesions.height10,
                      right: Dimesions.height20 * 2.5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(false);
                        },
                        child: AppIcon(
                            iconSize: Dimesions.iconSize24,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            icon: Icons.remove),
                      ),
                      BigText(
                        text:
                            "\$ ${product.price!} X  ${controller.inCartItems}",
                        color: AppColors.mainBlackColor,
                        size: Dimesions.font26,
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.setQuantity(true);
                        },
                        child: AppIcon(
                            iconSize: Dimesions.iconSize24,
                            iconColor: Colors.white,
                            backgroundColor: AppColors.mainColor,
                            icon: Icons.add),
                      ),
                    ],
                  ),
                ),
                Container(
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
                          borderRadius:
                              BorderRadius.circular(Dimesions.radius20),
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: AppColors.mainColor,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addItem(product);
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
                            text: "\$ ${product.price!}  | Add To Cart",
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ));
  }
}
