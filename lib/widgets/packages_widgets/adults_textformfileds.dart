import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/widgets/packages_widgets/no_of_rooms_childrens_adults.dart';

class Adultstextformfields extends StatelessWidget {
  final int index;
  const Adultstextformfields({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Adult ${index + 1}',
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
                controller: adultNameControllers[index],
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
                controller: adultAgeControllers[index],
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
    );
  }
}
class Childrenstextfromfileds extends StatelessWidget {
  final int index;
  const Childrenstextfromfileds({
    super.key, required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Children ${index + 1}',
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
                controller: childrenNameControllers[index],
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
                controller: childrenAgeControllers[index],
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
    );
  }
}
