import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:slide_to_act_reborn/slide_to_act_reborn.dart';
import 'package:tripx_user_application/screens/package_details/package_price.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/packages_widgets/usable_containers.dart';

class PriceShowing extends StatefulWidget {
  const PriceShowing({
    super.key,
    required this.widget,
    required this.numberofAdults,
    required this.totaladultcost,
    required this.numberofrooms,
    required this.totalhotelcost,
    required this.numberofChildrens,
    required this.totalchildcost,
    required this.companycharge,
    required this.grandtotal,
    required Razorpay razorpay,
  }) : _razorpay = razorpay;

  final PackagePrice widget;
  final int numberofAdults;
  final int totaladultcost;
  final int numberofrooms;
  final int totalhotelcost;
  final int numberofChildrens;
  final int totalchildcost;
  final int companycharge;
  final int grandtotal;
  final Razorpay _razorpay;

  @override
  State<PriceShowing> createState() => _PriceShowingState();
}

class _PriceShowingState extends State<PriceShowing> {
  
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
      widget._razorpay.open(options);
    } catch (e) {
      debugPrint('error : $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UsableContainer(
          text: 'PACKAGE COST',
          text2: '₹ ${widget.widget.itemslists['packageamount']}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        UsableContainer(
          text: '${widget.numberofAdults} PERSON',
          text2: '₹ ${widget.totaladultcost}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        UsableContainer(
          text: '${widget.numberofrooms} HOTEL NIGHT',
          text2: '₹ ${widget.totalhotelcost}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        UsableContainer(
          text: '${widget.numberofChildrens} CHILD',
          text2: '₹ ${widget.totalchildcost}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        UsableContainer(
          text: 'COMPANY CHARGES',
          text2: '₹ ${widget.companycharge}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        UsableContainer(
          text: 'TOTAL AMOUNT',
          text2: '₹ ${widget.grandtotal}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        UsableContainer(
          text: 'GRAND TOTAL',
          text2: '₹ ${widget.grandtotal}',
        ),
        SizedBox(
          height: mediaqueryheight(0.03, context),
        ),
        SlideAction(
          onSubmit: () {
            openCheckout(widget.grandtotal);
            debugPrint('Grand total: ${widget.grandtotal}');
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
    );
  }
}
