import 'package:flutter/material.dart';
import 'package:tripx_user_application/screens/chat_screen/chat.dart';
import 'package:tripx_user_application/screens/favorites/favorites.dart';
import 'package:tripx_user_application/screens/home_screen/home_screen.dart';
import 'package:tripx_user_application/screens/my_tickets/mytickets.dart';
import 'package:tripx_user_application/screens/flight_radar/flightradar.dart';

List<Widget> pages = [
  const HomeScreen(),
  const ChatScreen(),
  const Flightradar(),
  const Mytickets(),
  const Favoritepage()
];
