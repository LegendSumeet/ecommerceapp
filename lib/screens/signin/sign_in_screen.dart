import 'package:ecommerceapp/utils/size_config.dart';
import 'package:flutter/material.dart';


import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Body(),
      ),
    );
  }
}
