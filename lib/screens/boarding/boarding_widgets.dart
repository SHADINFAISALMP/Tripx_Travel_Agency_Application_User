import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/boarding/boarding_bloc_bloc.dart';
import 'package:tripx_user_application/screens/boarding/boarding_1.dart';
import 'package:tripx_user_application/screens/log_in_screen/log_in.dart';
import 'package:tripx_user_application/utils/colors.dart';
import 'package:tripx_user_application/utils/fonts.dart';
import 'package:tripx_user_application/utils/mediaquery.dart';

class Boardingwidgets extends StatelessWidget {
  const Boardingwidgets({
    Key? key,
    required this.color,
    required this.title,
    required this.image,
    required this.skip,
    required this.ontab,
    required this.boardingBloc,
  }) : super(key: key);

  final String color;
  final String title;
  final bool skip;
  final String image;
  final VoidCallback ontab;
  final BoardingBlocBloc boardingBloc;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BoardingBlocBloc, BoardingBlocState>(
      bloc: boardingBloc,
      listener: (context, state) {
        if (state is Boardingnavigate) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Login(),
          ));
        }
      },
      child: ColoredBox(
        color: whitecolor,
        child: Stack(
          children: [
            Container(
              height: mediaqueryheight(.9, context),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: mediaqueryheight(.27, context),
                decoration: const BoxDecoration(
                  color: whitecolor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: mediaqueryheight(.06, context)),
                  child: Column(
                    children: [
                      SizedBox(
                        height: mediaqueryheight(.06, context),
                      ),
                      mytext(
                        title,
                        color: blackcolor,
                        fontSize: mediaqueryheight(.026, context),
                        fontFamily: sedan,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: mediaqueryheight(.01, context),
              left: 0,
              right: 0,
              child: Padding(
                padding: EdgeInsets.all(
                  mediaqueryheight(.013, context),
                ),
                child: skip
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()));
                            },
                            child: mytext(
                              "Skip Now",
                              fontFamily: sedan,
                              fontWeight: FontWeight.bold,
                              fontSize: mediaqueryheight(.023, context),
                              color: blackcolor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              (pageController.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.linear));
                            },
                            child: Container(
                              padding: EdgeInsets.all(
                                mediaqueryheight(.02, context),
                              ),
                              decoration: BoxDecoration(
                                color: blackcolor,
                                borderRadius: BorderRadius.circular(
                                  mediaqueryheight(.026, context),
                                ),
                              ),
                              child: const Icon(
                                Icons.arrow_forward_ios_sharp,
                                color: colorteal,
                              ),
                            ),
                          )
                        ],
                      )
                    : SizedBox(
                        height: mediaqueryheight(.059, context),
                        child: MaterialButton(
                          color: blackcolor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          onPressed: () {
                            boardingBloc.add(Boardinggetstartedclick());
                          },
                          child: mytext(
                            "Get Started",
                            fontFamily: sedan,
                            fontSize: mediaqueryheight(.026, context),
                            color: colorteal,
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
