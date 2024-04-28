import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/bottomnavigation/bottomnavigation_bloc.dart';
import 'package:tripx_user_application/utils/bottomnavigation_list.dart';

import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Bottomnavigation extends StatefulWidget {
  const Bottomnavigation({super.key});

  @override
  State<Bottomnavigation> createState() => _BottomnavigationState();
}

class _BottomnavigationState extends State<Bottomnavigation> {
   late NotchBottomBarController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = NotchBottomBarController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomnavigationBloc, BottomnavigationState>(
      builder: (context, state) {
        return Scaffold(
            body: pages[(BlocProvider.of<BottomnavigationBloc>(context).state
                    as TabChangedState)
                .selectedindex],
            bottomNavigationBar: AnimatedNotchBottomBar(
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: whitecolor,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: colorteal,
                  ),
                  itemLabel: 'HOME',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.search,
                    color: whitecolor,
                  ),
                  activeItem: Icon(
                    Icons.search,
                    color: colorteal,
                  ),
                  itemLabel: 'SEARCH',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.airplane_ticket,
                    color: whitecolor,
                  ),
                  activeItem: Icon(
                    Icons.airplane_ticket,
                    color: colorteal,
                  ),
                  itemLabel: 'MY BOOKINGS',
                ),
              ],
              notchBottomBarController: _pageController,
              onTap: (int value) {
                BlocProvider.of<BottomnavigationBloc>(context)
                    .add(ChangeTabEvent(pageIndex: value));
              },
              kIconSize: mediaqueryheight(.03, context),
              kBottomRadius: mediaqueryheight(.02, context),
              notchColor: whitecolor,
              color: colorteal,
              itemLabelStyle: const TextStyle(color: white70, fontSize: 8),
              bottomBarHeight: mediaqueryheight(.04, context),
            ));
      },
    );
  }
}