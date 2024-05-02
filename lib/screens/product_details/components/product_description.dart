import 'package:ecommerceapp/models/Products.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../models/Product.dart';
import '../../../utils/size_config.dart';
import 'expandable_text.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
              TextSpan(
                  text: product.title,
                  style: TextStyle(
                    fontSize: 21,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: "\n${product.category} ",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 15,
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: getProportionateScreenHeight(64),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 4,
                    child: Text.rich(
                      TextSpan(
                        text: "\₹${product.price}   ",
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.w900,
                          fontSize: 24,
                        ),
                        children: [
                          TextSpan(
                            text: "\n\₹${product.expense}",
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              color: kTextColor,
                              fontWeight: FontWeight.normal,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ExpandableText(
              title: "Highlights",
              content: product.collections[0].title,
            ),
            const SizedBox(height: 16),
            ExpandableText(
              title: "Description",
              content: product.description,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }
}
