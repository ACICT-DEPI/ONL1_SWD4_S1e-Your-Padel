import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourpadel/presentation_layer/screens/Reserve_screen/Reserve_screen.dart';
import 'package:yourpadel/presentation_layer/screens/Navigation_screen/States.dart';
import 'package:yourpadel/presentation_layer/screens/News_screen/News_screen.dart';
import 'package:yourpadel/presentation_layer/screens/about_screen/about_screen.dart';
import 'package:yourpadel/presentation_layer/screens/profile_screen/profile_screen.dart';
import 'package:yourpadel/presentation_layer/screens/reservation/reservation_screen.dart';


class NavigationCubit extends Cubit<NavigationStates> {
  NavigationCubit() : super(NavigationInitialState());

  static NavigationCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    News(),
    BookingHistoryScreen(),
    ReservationScreen(),
    About(),
    ProfileScreen(),
  ];

  void changeBottom(int index) {
    currentIndex = index;
    emit(NavigationChangeBottomNavState());
  }
}