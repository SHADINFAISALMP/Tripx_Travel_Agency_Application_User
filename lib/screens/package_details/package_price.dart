import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/models/traveller_model.dart';
import 'package:tripx_user_application/screens/my_tickets/mytickets.dart';
import 'package:tripx_user_application/screens/package_details/priceshowing.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/widgets/packages_widgets/usable_containers.dart';

class PackagePrice extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> itemslists;
  final int adultsCount;
  final int childrenCount;
  final int roomsCount;
  final Travelpackage travelpackage;
  const PackagePrice(
      {super.key,
      required this.itemslists,
      required this.adultsCount,
      required this.childrenCount,
      required this.roomsCount,
      required this.travelpackage});

  @override
  _PackagePriceState createState() => _PackagePriceState();
}

class _PackagePriceState extends State<PackagePrice> {
  late Razorpay _razorpay;

  void handlePaymentsuccess(PaymentSuccessResponse response) async {
    Fluttertoast.showToast(
      msg: "Payment Successful: ${response.paymentId!}",
      toastLength: Toast.LENGTH_LONG,
    );

    try {
      final packageEvent = SubmitTravelPackage(widget.travelpackage);
      BlocProvider.of<PackageBloc>(context).add(packageEvent);

      Fluttertoast.showToast(
        msg: "Travel package saved successfully!",
        toastLength: Toast.LENGTH_LONG,
      );
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Mytickets()));
    } catch (e) {
      Fluttertoast.showToast(
        msg: "Failed to save travel package: $e",
        toastLength: Toast.LENGTH_LONG,
      );
    }
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
            child: const Appbar(),
          ),
        ),
        body: BlocConsumer<PackageBloc, PackageState>(
          listener: (context, state) {
            if (state is Packagesucess) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Travel package saved successfully!')),
              );
            } else if (state is Packageerror) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Failed to save travel package!')),
              );
            }
          },
          builder: (context, state) {
            if (state is PackageLoading) {
              Center(
                  child: LoadingAnimationWidget.threeArchedCircle(
                      color: orangecolor, size: 60));
            }
            return SingleChildScrollView(
                child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: PriceShowing(
                    widget: widget,
                    numberofAdults: numberofAdults,
                    totaladultcost: totaladultcost,
                    numberofrooms: numberofrooms,
                    totalhotelcost: totalhotelcost,
                    numberofChildrens: numberofChildrens,
                    totalchildcost: totalchildcost,
                    companycharge: companycharge,
                    grandtotal: grandtotal,
                    razorpay: _razorpay),
              ),
            ));
          },
        ));
  }
}