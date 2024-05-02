import 'package:ecommerceapp/controllers/Products.dart';
import 'package:ecommerceapp/screens/success.dart';
import 'package:ecommerceapp/utils/dsds.dart';
import 'package:ecommerceapp/utils/listofcartid.dart';
import 'package:ecommerceapp/utils/rad.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class EventPayMent extends StatefulWidget {
  final List<String> ids;
  final int price;
  const EventPayMent({Key? key, required this.ids, required this.price}) : super(key: key);

  @override
  State<EventPayMent> createState() => _EventPayMentState();
}

class _EventPayMentState extends State<EventPayMent> {
  late Razorpay _razorpay;
  TextEditingController amtcontroller = TextEditingController();

  void openCheckout() async {
   int amount = widget.price * 100;
    Map<String, dynamic> options = {
      'key': 'rzp_test_AAnKi0nwmhTdF3',
      'amount': amount,
      'name': 'eshoppee',
      'prefill': {'contact': '1234567890', 'email': 'test@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void handlepaymentsuccess(PaymentSuccessResponse response) async {
    showLoadingDialog(context);
    await Provider.of<ProductDatabaseHelper>(context, listen: false)
        .proceedToCheckout(widget.ids);
    StringListSharedPreferences().clearAll();
    Get.to(() => PaymentSuccessScreen());
    Fluttertoast.showToast(
        msg: "Payment Successfull ", toastLength: Toast.LENGTH_LONG);
  }

  Future<void> handlepaymentfailure(PaymentFailureResponse response) async {
    Fluttertoast.showToast(
        msg: "Payment fail " + response.message!,
        toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet " + response.walletName!,
        toastLength: Toast.LENGTH_SHORT);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlepaymentsuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlepaymentfailure);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDefaultIconDarkColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kWhite),
        backgroundColor: kYellowExpires2,
        title: Text(
          "Checkout",
          style: TextStyle(color: kWhite),
        ),
        scrolledUnderElevation: 0,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Container(
              padding: EdgeInsets.all(kPadding12),
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: newlight,
              ),
              child: Container(),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: 50,
            decoration: BoxDecoration(
                color: kWhite, borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(kPadding8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton.icon(
                      onPressed: () {
                        int price = 100;
                        openCheckout();
                      },
                      icon: Icon(Icons.payments),
                      label: Text("Pay"))
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
