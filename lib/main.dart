import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/boarding/boarding_bloc_bloc.dart';
import 'package:tripx_user_application/bloc/bottomnavigation/bottomnavigation_bloc.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_bloc.dart';
import 'package:tripx_user_application/bloc/chat_bloc/chat_event.dart';
import 'package:tripx_user_application/bloc/favorite/favorite_cubit.dart';
import 'package:tripx_user_application/bloc/flight/flight_bloc.dart';
import 'package:tripx_user_application/bloc/flight_recents/flight_recents_bloc.dart';
import 'package:tripx_user_application/bloc/google_sign/google_bloc.dart';
import 'package:tripx_user_application/bloc/hotel/hotel_bloc.dart';
import 'package:tripx_user_application/bloc/login/login_bloc.dart';
import 'package:tripx_user_application/bloc/packagebloc/package_bloc.dart';
import 'package:tripx_user_application/bloc/profile/profile_bloc.dart';
import 'package:tripx_user_application/bloc/signup/signup_bloc.dart';
import 'package:tripx_user_application/bloc/signupimage/profileimage_bloc.dart';
import 'package:tripx_user_application/firebase_options.dart';
import 'package:tripx_user_application/screens/chat_screen/chat_Service.dart';
import 'package:tripx_user_application/screens/flight_radar/flight_routes_bloc.dart';

import 'package:tripx_user_application/screens/splash/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ChatBloc(ChatService())..add(LoadMessages()),
      ),
      BlocProvider(
        create: (context) => HomescreenListItemsCubit(),
      ),
      BlocProvider(
        create: (context) => FlightRoutesBloc(context),
      ),
      BlocProvider(
        create: (context) => SignupBloc(),
      ),
      BlocProvider(
        create: (context) => HotelCubit(),
      ),
      BlocProvider(
        create: (context) => FlightBloc(),
      ),
      BlocProvider(
        create: (context) => RecentSearchBloc(),
      ),
      BlocProvider(
        create: (context) => GoogleBloc(),
      ),
      BlocProvider(
        create: (context) => ProfileimageBloc(),
      ),
      BlocProvider<BoardingBlocBloc>(create: (context) => BoardingBlocBloc()),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
      BlocProvider(
        create: (context) => BottomnavigationBloc(),
      ),
      BlocProvider(
        create: (context) => ProfileBloc(),
      ),
      BlocProvider(
        create: (context) => PackageBloc(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
