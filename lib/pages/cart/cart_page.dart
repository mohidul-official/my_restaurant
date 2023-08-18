import 'package:flutter/material.dart';
import 'package:my_restaurant/utils/colors.dart';
import 'package:my_restaurant/utils/dimensions.dart';
import 'package:my_restaurant/widgets/app_icon.dart';

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
                AppIcon(
                  icon: Icons.home_outlined,
                  iconColor: Colors.white,
                  backgroundColor: AppColors.mainColor,
                  iconSize: Dimesions.iconSize24,
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
        ],
      ),
    );
  }
}
