import 'package:car_milage/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'application/screen/bloc/screen_bloc.dart';

// Drivers are concerned with the mileage their automobiles get.
// One driver has kept track of several trips by recording the
// miles driven and gallons used for each tankful. Develop
// a Java application that will input the miles driven and
//gallons used (both as integers) for each trip.
// The program should calculate and display the miles
// per gallon obtained for each trip and print the
// combined miles per gallon obtained for all trips up
// to this point. All averaging calculations should
// produce floating-point results. Use class Scanner
//and sentinel-controlled repetition to obtain the
// data from the user
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => ScreenBloc(),
        child: Screen(),
      ),
    );
  }
}
