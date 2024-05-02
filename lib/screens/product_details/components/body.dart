import 'package:ecommerceapp/controllers/Products.dart';
import 'package:ecommerceapp/models/Product.dart';
import 'package:ecommerceapp/models/Products.dart';
import 'package:ecommerceapp/screens/product_details/components/product_images.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../utils/size_config.dart';
import 'product_actions_section.dart';
import 'product_review_section.dart';

class Body extends StatelessWidget {
  final String productId;

  const Body({
    Key? key,
    required this.productId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(screenPadding)),
          child: FutureBuilder<Product>(
            future: ProductDatabaseHelper().getProductById(productId),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final product = snapshot.data;
                if (product != null) {
                  return Column(
                    children: [
                      ProductImages(product: product),
                      SizedBox(height: getProportionateScreenHeight(20)),
                      ProductActionsSection(product: product),
                      SizedBox(height: getProportionateScreenHeight(100)),
                    ],
                  );
                }
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                final error = snapshot.error.toString();
              }
              return Center(
                child: Icon(
                  Icons.error,
                  color: kTextColor,
                  size: 60,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
