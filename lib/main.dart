import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_restaurant/app_scroll_behavior.dart';
import 'package:my_restaurant/controllers/popular_product_controller.dart';
import 'package:my_restaurant/controllers/recommended_product_controller.dart';
import 'package:my_restaurant/pages/cart/cart_page.dart';
import 'package:my_restaurant/pages/food/popular_food_detail.dart';
import 'package:my_restaurant/pages/food/recommended_food_detail.dart';
import 'package:my_restaurant/pages/home/main_food_page.dart';
import 'package:my_restaurant/routes/route_helper.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();

    Get.find<RecommendedProductController>().getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: AppScrollBehavior(),
      title: 'Flutter Demo',

      home: MainFooPage(),
      //home: RecommendedFoodDetails(),
      //home: PopularFoodDetail(),
      initialRoute: RouteHelper.initial,
      getPages: RouteHelper.routes,
      //home: CartPage(),
    );
  }
}
