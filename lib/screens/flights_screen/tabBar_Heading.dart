import 'package:flutter/material.dart';
import 'package:tripx_user_application/utils/colors.dart';

class TabBarHeading extends StatelessWidget {
  const TabBarHeading({
    super.key,
    required TabController tabController,
  }) : _tabController = tabController;

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      indicatorWeight: 4.0,
      indicatorColor: orangecolor,
      controller: _tabController,
      tabs: const [
        Tab(
          child: Text(
            "ONE WAY",
            style: TextStyle(
              fontFamily: 'Sedan',
              fontSize: 16,
              color: colorteal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
        Tab(
          child: Text(
            "ROUND TRIP",
            style: TextStyle(
              fontFamily: 'Sedan',
              fontSize: 16,
              color: colorteal,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}