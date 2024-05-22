import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
  TextEditingController adultsController = TextEditingController(text: '1');
  TextEditingController childrenController = TextEditingController();
  TextEditingController roomsController = TextEditingController(text: '1');
  int adultsCount = 1;
  int childrenCount = 0;
  int roomsCount = 1;
  List<TextEditingController> adultNameControllers = [];
  List<TextEditingController> adultAgeControllers = [];
  List<TextEditingController> childrenNameControllers = [];
  List<TextEditingController> childrenAgeControllers = [];
class appbarcontainer extends StatelessWidget {
  const appbarcontainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          'ADD PERSON',
          fontFamily: bodoni,
          fontSize: 25,
          color: colorteal,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
 List<Widget> buildAdultFields() {
    List<Widget> adultFields = [];
    for (int i = 0; i < adultsCount; i++) {
      adultFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Adult ${i + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: whitecolor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: adultNameControllers[i],
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: colorteal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: adultAgeControllers[i],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      hintStyle: TextStyle(color: colorteal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }
    return adultFields;
  }
  List<Widget> buildchildrenFields() {
    if (childrenNameControllers.isEmpty || childrenAgeControllers.isEmpty) {
      return [const Text('No children specified')];
    }

    List<Widget> childrenFields = [];
    for (int i = 0; i < childrenCount; i++) {
      childrenFields.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Children ${i + 1}',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: whitecolor,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 4,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextFormField(
                    controller: childrenNameControllers[i],
                    decoration: const InputDecoration(
                      hintText: 'Name',
                      hintStyle: TextStyle(color: colorteal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  TextFormField(
                    controller: childrenAgeControllers[i],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Age',
                      hintStyle: TextStyle(color: colorteal),
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                      border: InputBorder.none,
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    }
    return childrenFields;
  }

  class Numberofrooms extends StatelessWidget {
  const Numberofrooms({
    super.key,
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
          borderRadius:
              const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Number of Rooms:',
            style: TextStyle(color: colorteal),
          ),
          Container(
            width: mediaquerywidht(0.14, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorteal),
            ),
            child: TextFormField(
              controller: roomsController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final int newCount = int.tryParse(value) ?? 1;
                BlocProvider.of<PackageBloc>(context)
                    .add(UpdateRoomsCount(newCount));
              },
              decoration: const InputDecoration(
                hintText: 'Enter',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class Numberofchildrens extends StatelessWidget {
  const Numberofchildrens({
    super.key,
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
          borderRadius:
              const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Number of Children:',
            style: TextStyle(color: colorteal),
          ),
          Container(
            width: mediaquerywidht(0.14, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorteal),
            ),
            child: TextFormField(
              controller: childrenController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final int newCount = int.tryParse(value) ?? 0;
                BlocProvider.of<PackageBloc>(context)
                    .add(UpdateChildrenCount(newCount));
              },
              decoration: const InputDecoration(
                hintText: 'Enter',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class Numberofadults extends StatelessWidget {
  const Numberofadults({
    super.key,
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
          borderRadius:
              const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Number of Adults:',
            style: TextStyle(color: colorteal),
          ),
          Container(
            width: mediaquerywidht(0.14, context),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: colorteal),
            ),
            child: TextFormField(
              controller: adultsController,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final int newCount = int.tryParse(value) ?? 1;
                BlocProvider.of<PackageBloc>(context)
                    .add(UpdateAdultsCount(newCount));
              },
              decoration: const InputDecoration(
                hintText: 'Enter',
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10),
                border: InputBorder.none,
              ),
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ],
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
