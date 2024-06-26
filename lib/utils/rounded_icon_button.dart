import 'package:flutter/material.dart';

import 'constants.dart';
import 'size_config.dart';



class RoundedIconButton extends StatelessWidget {
  final IconData iconData;
  final GestureTapCallback press;
  const RoundedIconButton({
    Key? key,
    required this.iconData,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getProportionateScreenWidth(40),
      width: getProportionateScreenWidth(40),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)), backgroundColor: Colors.white,
          padding: EdgeInsets.zero,
        ),
        onPressed: press,
        child: Icon(
          iconData,
          color: kTextColor,
        ),
      ),
    );
  }
}
