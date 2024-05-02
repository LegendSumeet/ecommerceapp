import 'package:ecommerceapp/screens/product_details/provider_models/ExpandText.dart';
import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';
import 'components/home_screen_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Consumer<ExpandText>(builder: (context, expandText, child) {
        return Body();
      }),
      drawer: HomeScreenDrawer(),
    );
  }
}
