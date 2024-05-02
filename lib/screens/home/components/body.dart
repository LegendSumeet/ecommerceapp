
import 'package:ecommerceapp/screens/cart/cart_screen.dart';
import 'package:ecommerceapp/screens/product_details/product_details_screen.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/home_header.dart';
import 'product_type_box.dart';
import 'products_section.dart';

const String ICON_KEY = "icon";
const String TITLE_KEY = "title";
const String PRODUCT_TYPE_KEY = "product_type";

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final productCategories = <Map>[
    <String, dynamic>{
      ICON_KEY: "assets/icons/Electronics.svg",
      TITLE_KEY: "Electronics",

    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/Books.svg",
      TITLE_KEY: "Books",
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/Fashion.svg",
      TITLE_KEY: "Fashion",
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/Groceries.svg",
      TITLE_KEY: "Groceries",
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/Art.svg",
      TITLE_KEY: "Art",
    },
    <String, dynamic>{
      ICON_KEY: "assets/icons/Others.svg",
      TITLE_KEY: "Others",
    },
  ];


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: refreshPage,
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(screenPadding)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: getProportionateScreenHeight(15)),
                HomeHeader(
                  onSearchSubmitted: (value) async {
                    final query = value.toString();
                    if (query.length <= 0) return;
                    List<String> searchedProductsId;
                    try {

                    } catch (e) {

                    }
                  },
                  onCartButtonPressed: () async {
                     Get.to(() => CartScreen());
                  },
                ),
                SizedBox(height: getProportionateScreenHeight(15)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      children: [
                        ...List.generate(
                          productCategories.length,
                          (index) {
                            return ProductTypeBox(
                              icon: productCategories[index][ICON_KEY],
                              title: productCategories[index][TITLE_KEY],
                              onPress: () {

                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.5 +133,
                  child: ProductsSection(
                    sectionTitle: "Products You Like",
                    emptyListMessage: "Add Product to Favourites",
                    onProductCardTapped: onProductCardTapped,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.8,
                  child: ProductsSection(
                    sectionTitle: "Explore All Products",
                    emptyListMessage: "Looks like all Stores are closed",
                    onProductCardTapped: onProductCardTapped,
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(80)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> refreshPage() {
    return Future<void>.value();
  }

  void onProductCardTapped(String productId) {
    Get.to(() => ProductDetailsScreen(productId: productId));
  }
}
