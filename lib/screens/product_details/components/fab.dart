import 'package:ecommerceapp/utils/listofcartid.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../cart/cart_screen.dart';

class AddToCartFAB extends StatelessWidget {
  const AddToCartFAB({
    Key? key,
    required this.productId,
  }) : super(key: key);

  final String productId;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await StringListSharedPreferences().addStringToList(productId);
        Get.to(() => CartScreen());
      },
      label: const Text(
        "Add to Cart",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      icon: const Icon(
        Icons.shopping_cart,
      ),
    );
  }
}
