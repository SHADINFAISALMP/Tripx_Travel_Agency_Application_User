import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:tripx_user_application/screens/my_tickets/mytickets.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class PackagePrice extends StatefulWidget {
  const PackagePrice({super.key});

  @override
  _PackagePriceState createState() => _PackagePriceState();
}

class _PackagePriceState extends State<PackagePrice> {
  late Razorpay _razorpay;

  void openCheckout(grandtotal) {
    grandtotal = grandtotal * 100;
    var options = {
      'key': 'rzp_test_9m06FqDA5cAjgM',
      'totalamount': grandtotal,
      'name': 'TRIPIX TRAVEL AGENCY',
      'prefill': {
        'contact': '9072051005',
        'email': 'shadinfaisal305@gmail.com'
      },
      'external': {
        'wallets': ['paytm', 'googlepay', 'phonepay']
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('error : $e');
    }
  }

  void handlePaymentsuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Succesful${response.paymentId!}",
        toastLength: Toast.LENGTH_LONG);
  }

  void handlePaymenterror(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "Payment Failed${response.message!}",
        toastLength: Toast.LENGTH_LONG);
  }

  void handleExtrnalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "External Wallet${response.walletName!}",
        toastLength: Toast.LENGTH_LONG);
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
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentsuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymenterror);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExtrnalWallet);
  }

  int numberOfTravelers = 1;

  @override
  Widget build(BuildContext context) {
    const int packageCost = 295000;
    const int perPersonCost = 1000;
    const int hotelNightCost = 1500;
    const int perChildCost = 1000;
    const int taxCharges = 500;
    final int totalPassengersCost = perPersonCost * numberOfTravelers;
    final int totalAmount = packageCost +
        totalPassengersCost +
        hotelNightCost +
        perChildCost +
        taxCharges;
    final int grandTotal = totalAmount * numberOfTravelers;

    return Scaffold(
      backgroundColor: colorteal,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 4,
                offset: const Offset(0, 3),
              ),
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
            color: whitecolor,
          ),
          child: AppBar(
            leading: const Icon(
              Icons.arrow_back_ios,
              color: colorteal,
            ),
            centerTitle: true,
            title: mytext(
              'PRICE SUMMARY',
              fontFamily: bodoni,
              fontSize: 25,
              color: colorteal,
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                UsableContainer(
                  text: 'PACKAGE COST',
                  text2: '₹ $packageCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'PER PERSON',
                  text2: '₹ $perPersonCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'HOTEL NIGHT',
                  text2: '₹ $hotelNightCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'PER CHILD',
                  text2: '₹ $perChildCost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'TAX & CHARGES',
                  text2: '₹ $taxCharges',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'TOTAL AMOUNT',
                  text2: '₹ $totalAmount',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'GRAND TOTAL',
                  text2: '₹ $grandTotal',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                SlideAction(
                  onSubmit: () {
                    openCheckout(grandTotal);
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => const Mytickets()));
                  },
                  text: "PAY AMOUNT",
                  sliderButtonIcon: Icon(Icons.chevron_right),
                  borderRadius: 10.0,
                  innerColor: whitecolor,
                  outerColor: orangecolor,
                  height: mediaqueryheight(0.05, context),
                  textStyle: TextStyle(
                    fontFamily: sedan,
                    fontSize: 20,
                    color: whitecolor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UsableContainer extends StatelessWidget {
  final String text;
  final String text2;

  const UsableContainer({
    super.key,
    required this.text,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: mediaqueryheight(0.07, context),
      width: mediaquerywidht(0.9, context),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
        color: whitecolor,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            text,
            style: const TextStyle(color: colorteal),
          ),
          Text(
            text2,
            style: const TextStyle(color: colorteal),
          ),
        ],
      ),
    );
  }
}
