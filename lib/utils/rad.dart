
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



const kDark = Color(0xFF000000);
const kLight = Color(0xFFFFFFFF);
const kLightGrey = Color(0x95D1CECE);
const kDarkGrey = Color(0xFF9B9B9B);
const kOrange = Color(0xfff55631);
const kLightBlue = Color(0xff3663e3);
const kDarkBlue = Color(0xff1c153e);
const kLightPurple = Color(0xff6352c5);
const kDarkPurple = Color(0xff6352c5);
const creamcolor = Color(0xfff5f5f5);
const kGreen = Color(0xff00b894);
const kSecond = Color(0xFFA98B98);
// Padding
const double kPaddingS = 8.0;
const double kPaddingM = 16.0;
const double kPaddingL = 32.0;

// Spacing
const double kSpaceS = 8.0;
const double kSpaceM = 16.0;

// Animation
const Duration kButtonAnimationDuration = Duration(milliseconds: 600);
const Duration kCardAnimationDuration = Duration(milliseconds: 400);
const Duration kRippleAnimationDuration = Duration(milliseconds: 400);
const Duration kLoginAnimationDuration = Duration(milliseconds: 1500);


class AppData {
  static final AppData _instance = AppData._internal();

  factory AppData() {
    return _instance;
  }

  AppData._internal();

  List<String> selectedTimeRanges = [];
}

const kSpacingUnit = 10;

const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);



class LoadingDialog extends StatelessWidget {
  const LoadingDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Animated loading indicator with a custom color
            SizedBox(
              height: 60,
              width: 60,
              child: CircularProgressIndicator(
                strokeWidth: 4,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              ),
            ),
            SizedBox(height: 16),

            // Text with loading message
            Text(
              'Hang tight, we\'re loading...',
              style: TextStyle(fontSize: 16),
            ),

            // Additional text or description
            SizedBox(height: 8),
            Text(
              'This may take a moment.',
              style: TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),

            // Add an animated widget or icon for extra flair
            SizedBox(height: 16),
            ScaleTransition(
              scale: AlwaysStoppedAnimation(1.5),
              child: Icon(
                Icons.hourglass_bottom,
                color: Colors.blue,
                size: 36,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showLoadingDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Animated loading indicator
              SizedBox(
                height: 60,
                width: 60,
                child: CircularProgressIndicator(
                  strokeWidth: 4,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
              ),
              SizedBox(height: 16),

              // Text with loading message
              Text(
                'Loading...',
                style: TextStyle(fontSize: 16),
              ),

              // Additional text or description
              SizedBox(height: 8),
              Text(
                'Please wait while we prepare your data.',
                style: TextStyle(fontSize: 14, color: Colors.grey),
                textAlign: TextAlign.center,
              ),

              // Add an animated widget or icon for extra flair
              SizedBox(height: 16),
              RotationTransition(
                turns: AlwaysStoppedAnimation(45 / 360),
                child: Icon(
                  Icons.hourglass_bottom,
                  color: Colors.blue,
                  size: 36,
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}


Future<String> getUserId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String userId = prefs.getString("usersId") ?? "";

  if (userId.isEmpty) {
    throw Exception("UserId is empty");
  }

  return userId;
}

class Statics {
  static const String appSign =
      'fdc8fbf0e23d693976c5d69a575f19cf188311c958054e255cfff39c780d3ab2';
  static const int appID = 468364649;
}

Future<String?> getDeviceTokenFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('deviceToken');
}



class Utils{



  static void showSnackBar(String title,String message,Widget icon){
    Get.showSnackbar(
        GetSnackBar(
          backgroundColor: Colors.black,
          title: title,
          isDismissible: true,
          duration: const Duration(milliseconds: 2000),
          icon: icon,
          message: message,
          snackPosition: SnackPosition.BOTTOM,
          borderRadius: 20,
          margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          snackStyle: SnackStyle.GROUNDED,
          barBlur: 30,
        )
    );
  }
}