import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripx_user_application/bloc/boarding/boarding_bloc_bloc.dart';
import 'package:tripx_user_application/screens/splash_screen.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<BoardingBlocBloc>(create: (context) => BoardingBlocBloc()),
    ], child: const MyApp(),
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

