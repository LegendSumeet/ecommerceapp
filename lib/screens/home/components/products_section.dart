
import 'package:ecommerceapp/controllers/Products.dart';
import 'package:ecommerceapp/models/Products.dart';
import 'package:ecommerceapp/screens/home/components/section_tile.dart';
import 'package:ecommerceapp/utils/nothingtoshow_container.dart';
import 'package:ecommerceapp/utils/product_card.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsSection extends StatelessWidget {
  final String sectionTitle;
  final String emptyListMessage;
  final Function onProductCardTapped;
  const ProductsSection({
    super.key,
    required this.sectionTitle,
    this.emptyListMessage = "No Products to show here",
    required this.onProductCardTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 14,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F6F9),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          SectionTile(
            title: sectionTitle,
            press: () {},
          ),
          buildProductsList(),
          SizedBox(height: getProportionateScreenHeight(15)),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }

  Widget buildProductsList() {
    return FutureBuilder<List<Products>>(
      future: ProductDatabaseHelper().getProducts(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final List<Products> products = snapshot.data!;
          final productsId = products.map((product) => product.id).toList();
          if (productsId.isNotEmpty) {
            return buildProductGrid(productsId);
          } else {
            return NothingToShowContainer(
              secondaryMessage: emptyListMessage,
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          final error = snapshot.error.toString();
          return Center(
            child: Text("Error: $error"),
          );
        }
        return const NothingToShowContainer(
          iconPath: "assets/icons/network_error.svg",
          primaryMessage: "Error Fetching Products",
          secondaryMessage: "Please try again later",
        );
      },
    );
  }


  Widget buildProductGrid(List<String> productsId) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.7,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      itemCount: productsId.length,
      itemBuilder: (context, index) {
        return ProductCard(
          productId: productsId[index],
          press: () {
            onProductCardTapped.call(productsId[index]);
          },
        );
      },
    );
  }
}
