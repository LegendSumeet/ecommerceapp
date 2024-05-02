import 'package:flutter/material.dart';
import 'components/body.dart';
import 'components/fab.dart';


class ProductDetailsScreen extends StatelessWidget {
  final String productId;

  const ProductDetailsScreen({
    Key? key,
    required this.productId,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: AppBar(
          backgroundColor: Color(0xFFF5F6F9),
        ),
        body: Body(
          productId: productId,
        ),
        floatingActionButton: AddToCartFAB(productId: productId),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
  }
}