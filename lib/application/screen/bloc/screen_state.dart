part of 'screen_bloc.dart';

@immutable
class ScreenState {
  final double milesInput;
  final double fuelConsumedInput;
  final List<Trip> allTrips;

  ScreenState({
    required this.milesInput,
    required this.fuelConsumedInput,
    required this.allTrips,
  });
}
