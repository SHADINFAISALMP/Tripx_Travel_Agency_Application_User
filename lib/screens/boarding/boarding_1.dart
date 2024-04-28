import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/boarding/boarding_bloc_bloc.dart';
import 'package:tripx_user_application/screens/boarding/boarding_widgets.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';
  final PageController pageController = PageController();
class Boardingone extends StatefulWidget {
  final BoardingBlocBloc bloc;
  const Boardingone({super.key, required this.bloc});

  @override
  State<Boardingone> createState() => _BoardingoneState();
}

class _BoardingoneState extends State<Boardingone> {


  void onNextpage() {
    if (BlocProvider.of<BoardingBlocBloc>(context, listen: true)
            .state
            .activepage <
        _pages.length - 1) {
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);
    }
  }

  final List<Map<String, dynamic>> _pages = [
    {
      'color': 'white',
      'title': 'BOOK FLIGHTS AND GO WHERE YOU WANT',
      'image': "assets/images/Airplane.jpeg",
      'skip': true
    },
    {
      'color': 'black',
      'title': 'BOOK YOUR FAVORITE HOTELS & RESORTS',
      'image': "assets/images/hotel.jpeg",
      'skip': true
    },
    {
      'color': 'white',
      'title': 'EXPLORE THE WORLD WITH OUR HOLIDAY PACKAGES ',
      'image': "assets/images/16 лучших мест Италии.jpeg",
      'skip': false
    }
  ];

  final BoardingBlocBloc boardingBloc = BoardingBlocBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: pageController,
              itemCount: _pages.length,
              onPageChanged: (int page) {
                context
                    .read<BoardingBlocBloc>()
                    .add(Boardingbuttonclick(index: page));
                // setState(() {});
              },
              itemBuilder: (BuildContext context, int index) {
                return Boardingwidgets(
                  color: _pages[index]['color'],
                  title: _pages[index]['title'],
                  image: _pages[index]['image'],
                  skip: _pages[index]['skip'],
                  ontab: onNextpage,
                  boardingBloc: boardingBloc,
                );
              }),
          Positioned(
              top: MediaQuery.of(context).size.height / 1.30,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildindicator(),
                  )
                ],
              ))
        ],
      ),
    );
  }

  List<Widget> _buildindicator() {
    final indicator = <Widget>[];
    for (var i = 0; i < _pages.length; i++) {
      if (BlocProvider.of<BoardingBlocBloc>(context, listen: true)
              .state
              .activepage ==
          i) {
        indicator.add(indicatortrue());
      } else {
        indicator.add(indicatorfalse());
      }
    }
    return indicator;
  }

  Widget indicatortrue() {
    if (BlocProvider.of<BoardingBlocBloc>(context, listen: true)
            .state
            .activepage ==
        0) {}
    return AnimatedContainer(
      duration: const Duration(
        microseconds: 300,
      ),
      height: mediaqueryheight(.01, context),
      width: mediaquerywidht(.11, context),
      margin: EdgeInsets.only(
        right: mediaqueryheight(.01, context),
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            mediaqueryheight(.026, context),
          ),
          color: colorteal),
    );
  }

  Widget indicatorfalse() {
    return AnimatedContainer(
      duration: const Duration(
        microseconds: 300,
      ),
      height: mediaqueryheight(.01, context),
      width: mediaquerywidht(.11, context),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            mediaqueryheight(.026, context),
          ),
          color: blackcolor),
    );
  }
}
