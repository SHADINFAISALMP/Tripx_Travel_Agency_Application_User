import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/widgets/packages_widgets/adults_textformfileds.dart';
import 'package:tripx_user_application/widgets/packages_widgets/bookpackagetoprice.dart';
import 'package:tripx_user_application/widgets/packages_widgets/no_of_rooms_childrens_adults.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
import 'package:tripx_user_application/widgets/packages_widgets/usable_containers.dart';

class PackagePerson extends StatefulWidget {
  final QueryDocumentSnapshot<Object?> itemslists;
  const PackagePerson({Key? key, required this.itemslists}) : super(key: key);

  @override
  _PackagePersonState createState() => _PackagePersonState();
}

class _PackagePersonState extends State<PackagePerson> {
  @override
  void initState() {
    super.initState();
    context.read<PackageBloc>().add(UpdateAdultsCount(adultsCount));
    context.read<PackageBloc>().add(UpdateChildrenCount(childrenCount));
    context.read<PackageBloc>().add(UpdateRoomsCount(roomsCount));
    _initializeControllers(adultsCount, childrenCount);
  }

  void _initializeControllers(int adultCount, int childrenCount) {
    adultNameControllers.clear();
    adultAgeControllers.clear();
    childrenNameControllers.clear();
    childrenAgeControllers.clear();
    for (int i = 0; i < adultCount; i++) {
      adultNameControllers.add(TextEditingController());
      adultAgeControllers.add(TextEditingController());
    }
    for (int i = 0; i < childrenCount; i++) {
      childrenNameControllers.add(TextEditingController());
      childrenAgeControllers.add(TextEditingController());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorteal,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(80.0),
        child: appbarcontainer(),
      ),
      body: BlocConsumer<PackageBloc, PackageState>(listener: (context, state) {
        if (state is Packageerror) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Failed to save travel package!')),
          );
        }
      }, builder: (context, state) {
        if (state is PackageLoading) {
          Center(
              child: LoadingAnimationWidget.threeArchedCircle(
                  color: whitecolor, size: 60));
        }
        if (state is PackageUpdated) {
          adultsCount = state.adultcount;
          childrenCount = state.childrencount;
          roomsCount = state.roomscount;
          _initializeControllers(adultsCount, childrenCount);

          while (adultNameControllers.length < adultsCount) {
            adultNameControllers.add(TextEditingController());
            adultAgeControllers.add(TextEditingController());
          }
          while (adultNameControllers.length > adultsCount) {
            adultNameControllers.removeLast();
            adultAgeControllers.removeLast();
          }

          while (childrenNameControllers.length < childrenCount) {
            childrenNameControllers.add(TextEditingController());
            childrenAgeControllers.add(TextEditingController());
          }
          while (childrenNameControllers.length > childrenCount) {
            childrenNameControllers.removeLast();
            childrenAgeControllers.removeLast();
          }

          adultsController.text = state.adultcount.toString();
          childrenController.text = state.childrencount.toString();
          roomsController.text = state.roomscount.toString();
        }
        return SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Numberofadults(),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  const Numberofchildrens(),
                  SizedBox(
                    height: mediaqueryheight(0.04, context),
                  ),
                  const Numberofrooms(),
                  const SizedBox(height: 20),
                  ...buildAdultFields(),
                  const SizedBox(height: 20),
                  ...buildchildrenFields(),
                  const SizedBox(height: 20),
                  Bookpackage(widget: widget),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  List<Widget> buildAdultFields() {
    if (adultNameControllers.isEmpty || adultAgeControllers.isEmpty) {
      return [const Text('No adults specified')];
    }
    return List<Widget>.generate(adultsCount, (index) {
      return Adultstextformfields(index: index);
    });
  }

  List<Widget> buildchildrenFields() {
    if (childrenNameControllers.isEmpty || childrenAgeControllers.isEmpty) {
      return [const Text('No children specified')];
    }
    return List<Widget>.generate(childrenCount, (index) {
      return Childrenstextfromfileds(index: index);
    });
  }
}
