import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/favorite/favorite_cubit.dart';
import 'package:tripx_user_application/bloc/favorite/favorite_state.dart';
import 'package:tripx_user_application/screens/package_details/package_details.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

// ignore: camel_case_types
class Homescreen_list_items extends StatefulWidget {
  final BuildContext context;
  final String imagePath;
  final QueryDocumentSnapshot<Object?> item;
  const Homescreen_list_items({
    super.key,
    required this.context,
    required this.imagePath,
    required this.item,
  });

  @override
  State<Homescreen_list_items> createState() => _Homescreen_list_itemsState();
}

// ignore: camel_case_types
class _Homescreen_list_itemsState extends State<Homescreen_list_items> {
  late HomescreenListItemsCubit _cubit;

  String _checkNullOrEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Not Available';
    }
    return value;
  }

  bool isFavorite = false;
  @override
  void initState() {
    super.initState();
    _cubit = HomescreenListItemsCubit();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    if (mounted) {
      _cubit.checkIfFavorite(widget.item.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _cubit,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PackageDetails(
                itemslists: widget.item,
              ),
            ),
          );
        },
        child: BlocBuilder<HomescreenListItemsCubit, HomescreenListItemsState>(
          builder: (context, state) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              decoration: BoxDecoration(
                border: Border.all(color: orangecolor),
                borderRadius: BorderRadius.circular(15),
                color: colorteal,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        Image.network(
                          widget.imagePath,
                          height: 260,
                          fit: BoxFit.cover,
                        ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: IconButton(
                            icon: Icon(
                              state.isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border_outlined,
                              color: Colors.red,
                              size: 30,
                            ),
                            onPressed: () async {
                              await context
                                  .read<HomescreenListItemsCubit>()
                                  .toggleFavorite(widget.item.id, {
                                'imagePath': widget.imagePath,
                                'packagename': widget.item['packagename'],
                                'placenames': widget.item['placenames'],
                                'packagediscription':
                                    widget.item['packagediscription'],
                                'days': widget.item['days'],
                                'night': widget.item['night'],
                                'packageamount': widget.item['packageamount'],
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.orange,
                                  content: Center(
                                    child: Text(
                                      state.isFavorite
                                          ? 'REMOVED FROM FAVORITES'
                                          : 'ADDED TO FAVORITES',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Bodoni',
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.tour, color: whitecolor),
                      const SizedBox(width: 5),
                      mytext(
                        _checkNullOrEmpty(widget.item['packagename']),
                        fontFamily: sedan,
                        fontSize: 25,
                        color: whitecolor,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.001, context),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(Icons.place, color: whitecolor),
                        const SizedBox(width: 5),
                        mytext(_checkNullOrEmpty(widget.item['placenames']),
                            fontFamily: sedan,
                            fontSize: 18,
                            color: whitecolor,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 5),
                        mytext(
                            _checkNullOrEmpty(
                                widget.item['packagediscription']),
                            fontFamily: sedan,
                            fontSize: 18,
                            color: whitecolor,
                            overflow: TextOverflow.ellipsis),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: mediaqueryheight(0.01, context),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      const Icon(Icons.sunny, color: whitecolor),
                      mytext(
                        _checkNullOrEmpty(widget.item['days']),
                        fontFamily: sedan,
                        fontSize: 18,
                        color: whitecolor,
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.nights_stay, color: whitecolor),
                      mytext(
                        _checkNullOrEmpty(widget.item['night']),
                        fontFamily: sedan,
                        fontSize: 18,
                        color: whitecolor,
                      ),
                      const SizedBox(width: 20),
                      const Icon(Icons.attach_money, color: whitecolor),
                      mytext(
                        widget.item['packageamount'],
                        fontFamily: sedan,
                        fontSize: 18,
                        color: whitecolor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
