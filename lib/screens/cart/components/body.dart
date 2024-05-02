import 'package:ecommerceapp/controllers/Products.dart';
import 'package:ecommerceapp/models/Product.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/screens/cart/cart_screen.dart';
import 'package:ecommerceapp/screens/payments.dart';
import 'package:ecommerceapp/screens/product_details/product_details_screen.dart';
import 'package:ecommerceapp/screens/product_details/provider_models/ExpandText.dart';
import 'package:ecommerceapp/utils/async_progress_dialog.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:ecommerceapp/utils/default_button.dart';
import 'package:ecommerceapp/utils/listofcartid.dart';
import 'package:ecommerceapp/utils/nothingtoshow_container.dart';
import 'package:ecommerceapp/utils/product_short_detail_card.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:ecommerceapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
            child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(10)),
                  Text(
                    "Your Cart",
                    style: headingStyle,
                  ),
                  SizedBox(height: getProportionateScreenHeight(20)),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.75,
                    child: Center(
                      child: buildCartItemsList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> refreshPage() {
    Provider.of<ExpandText>(context, listen: false).refresh();
    return Future<void>.value();
  }

  Widget buildCartItemsList() {
    return FutureBuilder<List<String>>(
      future: StringListSharedPreferences().getStringList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<String>? cartItemsId = snapshot.data;
          if (cartItemsId!.isEmpty) {
            return const Center(
              child: NothingToShowContainer(
                iconPath: "assets/icons/empty_cart.svg",
                secondaryMessage: "Your cart is empty",
              ),
            );
          }
          return Column(
            children: [
              DefaultButton(
                text: "Proceed to Payment",
                press: () async {
                  int totalamount = 0;
                  for (int i = 0; i < cartItemsId.length; i++) {
                    Product product = await ProductDatabaseHelper().getProductById(cartItemsId[i]);
                    totalamount += product.price;
                  }
                  print(totalamount);

                  Get.to(() => EventPayMent(
                    price: totalamount,
                    ids: cartItemsId,
                  ));
                },
              ),
              SizedBox(height: getProportionateScreenHeight(20)),
              const Text(
                "Swipe left to remove item",
                style: TextStyle(
                  color: kTextColor,
                  fontSize: 12,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  physics: const BouncingScrollPhysics(),
                  itemCount: cartItemsId.length,
                  itemBuilder: (context, index) {
                    if (index >= cartItemsId.length) {
                      return SizedBox(height: getProportionateScreenHeight(80));
                    }
                    return buildCartItemDismissible(
                        context, cartItemsId[index], index);
                  },
                ),
              ),
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          final error = snapshot.error;
        }
        return const Center(
          child: NothingToShowContainer(
            iconPath: "assets/icons/network_error.svg",
            primaryMessage: "Something went wrong",
            secondaryMessage: "Unable to connect to Database",
          ),
        );
      },
    );
  }

  Widget buildCartItemDismissible(
      BuildContext context, String cartItemId, int index) {
    return Dismissible(
      key: Key(cartItemId),
      direction: DismissDirection.startToEnd,
      dismissThresholds: const {
        DismissDirection.startToEnd: 0.65,
      },
      background: buildDismissibleBackground(),
      child: buildCartItem(cartItemId, index),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          final confirmation = await showConfirmationDialog(
            context,
            "Remove Product from Cart?",
          );
          if (confirmation) {
            if (direction == DismissDirection.startToEnd) {
              StringListSharedPreferences().removeStringFromList(cartItemId);
              Provider.of<ExpandText>(context, listen: false).refresh();
              return true;
            } else {
              return false;
            }
          }
        }
        return false;
      },
      onDismissed: (direction) {},
    );
  }

  Widget buildCartItem(String cartItemId, int index) {
    return Container(
      padding: const EdgeInsets.only(
        bottom: 4,
        top: 4,
        right: 4,
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: kTextColor.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: FutureBuilder<Product>(
        future: ProductDatabaseHelper().getProductById(cartItemId),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Product? product = snapshot.data;
            return Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 8,
                  child: ProductShortDetailCard(
                    productId: product!.id,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(
                            productId: product.id,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: kTextColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          child: const Icon(
                            Icons.arrow_drop_up,
                            color: kTextColor,
                          ),
                          onTap: () async {
                            // await arrowUpCallback(cartItemId);
                          },
                        ),
                        const SizedBox(height: 8),
                        const SizedBox(height: 8),
                        InkWell(
                          child: const Icon(
                            Icons.arrow_drop_down,
                            color: kTextColor,
                          ),
                          onTap: () async {
                            // await arrowDownCallback(cartItemId);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            final error = snapshot.error;
            return Center(
              child: Text(
                error.toString(),
              ),
            );
          } else {
            return const Center(
              child: Icon(
                Icons.error,
              ),
            );
          }
        },
      ),
    );
  }

  Widget buildDismissibleBackground() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            Icons.delete,
            color: Colors.white,
          ),
          SizedBox(width: 4),
          Text(
            "Delete",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> checkoutButtonCallback() async {}

  void shutBottomSheet() {}

  // Future<void> arrowUpCallback(String cartItemId) async {
  //   shutBottomSheet();
  //   final future = UserDatabaseHelper().increaseCartItemCount(cartItemId);
  //   future.then((status) async {
  //     if (status) {
  //       await refreshPage();
  //     } else {
  //       throw "Couldn't perform the operation due to some unknown issue";
  //     }
  //   }).catchError((e) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Something went wrong"),
  //     ));
  //   });
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AsyncProgressDialog(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(30),
  //             topRight: Radius.circular(30),
  //           ),
  //           boxShadow: [
  //             BoxShadow(
  //               color: const Color(0xFFDADADA).withOpacity(0.6),
  //               offset: const Offset(0, -15),
  //               blurRadius: 20,
  //             ),
  //           ],
  //         ),
  //         future,
  //         message: const Text("Please wait"), progress: const CircularProgressIndicator(), onError: (e) {
  //         ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //           content: Text("Something went wrong"),
  //         ));
  //       },
  //       );
  //     },
  //   );
  // }
  // Future<void> arrowDownCallback(String cartItemId) async {
  //   shutBottomSheet();
  //   final future = UserDatabaseHelper().decreaseCartItemCount(cartItemId);
  //   future.then((status) async {
  //     if (status) {
  //       await refreshPage();
  //     } else {
  //       throw "Couldn't perform the operation due to some unknown issue";
  //     }
  //   }).catchError((e) {
  //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //       content: Text("Something went wrong"),
  //     ));
  //   });
  //   await showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AsyncProgressDialog(
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: const BorderRadius.only(
  //             topLeft: Radius.circular(30),
  //             topRight: Radius.circular(30),
  //           ),
  //           boxShadow: [
  //             BoxShadow(
  //               color: const Color(0xFFDADADA).withOpacity(0.6),
  //               offset: const Offset(0, -15),
  //               blurRadius: 20,
  //             ),
  //           ],
  //         ),
  //         future,
  //         message: const Text("Please wait"), progress: const CircularProgressIndicator(), onError: (e) {
  //           ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //             content: Text("Something went wrong"),
  //           ));
  //         },
  //       );
  //     },
  //   );
  // }
}
