

import 'package:ecommerceapp/models/Product.dart';
import 'package:ecommerceapp/screens/product_details/components/product_description.dart';
import 'package:ecommerceapp/screens/product_details/provider_models/ProductActions.dart';
import 'package:ecommerceapp/utils/top_rounded_container.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/size_config.dart';

class ProductActionsSection extends StatelessWidget {
  final Product product;

  const ProductActionsSection({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final column = Column(
      children: [
        Stack(
          children: [
            TopRoundedContainer(
              child: ProductDescription(product: product),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: buildFavouriteButton(),
            ),
          ],
        ),
      ],
    );

    return column;
  }

  Widget buildFavouriteButton() {
    return Consumer<ProductActions>(
      builder: (context, productDetails, child) {
        return InkWell(
          onTap: () async {

          },
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(8)),
            decoration: BoxDecoration(
              color: productDetails.productFavStatus
                  ? Color(0xFFFFE6E6)
                  : Color(0xFFF5F6F9),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 4),
            ),
            child: Padding(
              padding: EdgeInsets.all(getProportionateScreenWidth(8)),
              child: Icon(
                Icons.favorite,
                color: productDetails.productFavStatus
                    ? Color(0xFFFF4848)
                    : Color(0xFFD8DEE4),
              ),
            ),
          ),
        );
      },
    );
  }
}
