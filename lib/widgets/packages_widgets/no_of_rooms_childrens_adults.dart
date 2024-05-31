import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

TextEditingController adultsController = TextEditingController();
TextEditingController childrenController = TextEditingController();
TextEditingController roomsController = TextEditingController(text: '1');
int adultsCount = 0;
int childrenCount = 0;
int roomsCount = 1;
List<TextEditingController> adultNameControllers = [];
List<TextEditingController> adultAgeControllers = [];
List<TextEditingController> childrenNameControllers = [];
List<TextEditingController> childrenAgeControllers = [];

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
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Text(
            'Number of Rooms:',
            style: TextStyle(color: colorteal),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: colorteal),
                onPressed: () {
                  _decrementCount(context, roomsController, 'rooms');
                },
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: colorteal),
                onPressed: () {
                  _incrementCount(context, roomsController, 'rooms');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _incrementCount(
      BuildContext context, TextEditingController controller, String type) {
    int count = int.tryParse(controller.text) ?? 0;
    count++;
    controller.text = count.toString();
    if (type == 'rooms') {
      BlocProvider.of<PackageBloc>(context).add(UpdateRoomsCount(count));
    }
  }

  void _decrementCount(
      BuildContext context, TextEditingController controller, String type) {
    int count = int.tryParse(controller.text) ?? 0;
    if (count > 0) count--;
    controller.text = count.toString();
    if (type == 'rooms') {
      BlocProvider.of<PackageBloc>(context).add(UpdateRoomsCount(count));
    }
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
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            'Number of Children:',
            style: TextStyle(color: colorteal),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: colorteal),
                onPressed: () {
                  _decrementCount(context, childrenController, 'children');
                },
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
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: colorteal),
                onPressed: () {
                  _incrementCount(context, childrenController, 'children');
                },
              ),
            ],
          ),
        ]));
  }

  void _incrementCount(
      BuildContext context, TextEditingController controller, String type) {
    int count = int.tryParse(controller.text) ?? 0;
    count++;
    controller.text = count.toString();
    if (type == 'children') {
      BlocProvider.of<PackageBloc>(context).add(UpdateChildrenCount(count));
    }
  }

  void _decrementCount(
      BuildContext context, TextEditingController controller, String type) {
    int count = int.tryParse(controller.text) ?? 0;
    if (count > 0) count--;
    controller.text = count.toString();
    if (type == 'children') {
      BlocProvider.of<PackageBloc>(context).add(UpdateChildrenCount(count));
    }
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
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            'Number of Adults:',
            style: TextStyle(color: colorteal),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: colorteal),
                onPressed: () {
                  _decrementCount(context, adultsController, 'adults');
                },
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
                    final int newCount = int.tryParse(value) ?? 0;
                    BlocProvider.of<PackageBloc>(context)
                        .add(UpdateAdultsCount(newCount));
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter',
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(color: Colors.black),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add, color: colorteal),
                onPressed: () {
                  _incrementCount(context, adultsController, 'adults');
                },
              ),
            ],
          ),
        ]));
  }

  void _incrementCount(
      BuildContext context, TextEditingController controller, String type) {
    int count = int.tryParse(controller.text) ?? 0;
    count++;
    controller.text = count.toString();
    if (type == 'adults') {
      BlocProvider.of<PackageBloc>(context).add(UpdateAdultsCount(count));
    }
  }

  void _decrementCount(
      BuildContext context, TextEditingController controller, String type) {
    int count = int.tryParse(controller.text) ?? 0;
    if (count > 0) count--;
    controller.text = count.toString();
    if (type == 'adults') {
      BlocProvider.of<PackageBloc>(context).add(UpdateAdultsCount(count));
    }
  }
}
