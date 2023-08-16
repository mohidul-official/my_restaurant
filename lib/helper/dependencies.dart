import 'package:get/get.dart';
import 'package:my_restaurant/controllers/popular_product_controller.dart';
import 'package:my_restaurant/data/api/api_client.dart';
import 'package:my_restaurant/data/repository/popular_product_repo.dart';

Future<void> init() async {
  // api client
  Get.lazyPut(() => ApiClient(appBaseUrl: "http://mvs.bslmeiyu.com"));

//repos
  Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));

//controllers
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
}
