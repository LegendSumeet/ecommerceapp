import 'package:ecommerceapp/screens/product_details/provider_models/ExpandText.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/body.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<ExpandText>(builder: (context, expandText, child) {
        return Body();
      }),
    );
  }
}
