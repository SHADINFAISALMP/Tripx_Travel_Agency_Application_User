import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/models/traveller_model.dart';

import 'package:tripx_user_application/screens/package_details/widgets.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class PackagePrice extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> itemslists;
  final int adultsCount;
  final int childrenCount;
  final int roomsCount;
  const PackagePrice(
      {super.key,
      required this.itemslists,
      required this.adultsCount,
      required this.childrenCount,
      required this.roomsCount});

  @override
  _PackagePriceState createState() => _PackagePriceState();
}

class _PackagePriceState extends State<PackagePrice> {
  late Razorpay _razorpay;

  void openCheckout(int grandtotal) {
    var options = {
      'key': 'rzp_test_9m06FqDA5cAjgM',
      'amount': grandtotal * 100,
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

  @override
  Widget build(BuildContext context) {
    final int numberofAdults = widget.adultsCount;
    final int numberofChildrens = widget.childrenCount;
    final int numberofrooms = widget.roomsCount;

    final int adultCost = int.parse(widget.itemslists['adult']);
    final int hotelcost = int.parse(widget.itemslists['hotelper']);
    final int childcost = int.parse(widget.itemslists['childper']);
    final int companycharge = int.parse(widget.itemslists['companycharge']);
    final int totaladultcost = numberofAdults * adultCost;
    final int totalchildcost = numberofChildrens * childcost;
    final int totalhotelcost = numberofrooms * hotelcost;
    final int grandtotal =
        totaladultcost + totalchildcost + totalhotelcost + companycharge;
    debugPrint('Adults count: $numberofAdults');
    debugPrint('Children count: $numberofChildrens');
    debugPrint('Rooms count: $numberofrooms');
    debugPrint('Grand total: $grandtotal');
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
                  text2: '₹ ${widget.itemslists['packageamount']}',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: '$numberofAdults PERSON',
                  text2: '₹ $totaladultcost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: '$numberofrooms HOTEL NIGHT',
                  text2: '₹ $totalhotelcost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: '$numberofChildrens CHILD',
                  text2: '₹ $totalchildcost',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'COMPANY CHARGES',
                  text2: '₹ $companycharge',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'TOTAL AMOUNT',
                  text2: '₹ $grandtotal',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                UsableContainer(
                  text: 'GRAND TOTAL',
                  text2: '₹ $grandtotal',
                ),
                SizedBox(
                  height: mediaqueryheight(0.03, context),
                ),
                SlideAction(
                  onSubmit: () {
                    Travelpackage travelpackage = Travelpackage(
                        adultcount: widget.adultsCount,
                        childrencount: widget.childrenCount,
                        roomscount: widget.roomsCount,
                        children: [],
                        adults: []);
                    context
                        .read<PackageBloc>()
                        .add(SubmitTravelPackage(travelpackage));
                    openCheckout(grandtotal);
                    debugPrint('Grand total: $grandtotal');
                  },
                  text: "PAY AMOUNT",
                  sliderButtonIcon: const Icon(Icons.chevron_right),
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
        )));
  }
}
