import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_milage/trip.dart';
import 'package:meta/meta.dart';

part 'screen_event.dart';
part 'screen_state.dart';

class ScreenBloc extends Bloc<ScreenEvent, ScreenState> {
  ScreenBloc()
      : super(
          ScreenState(
            milesInput: 0,
            fuelConsumedInput: 0,
            allTrips: [],
          ),
        );

  @override
  Stream<ScreenState> mapEventToState(
    ScreenEvent event,
  ) async* {
    if (event is MilesChangedEvent) {
      double? milesInputDouble = double.tryParse(event.milesInput);
      if (milesInputDouble != null) {
        yield ScreenState(
          milesInput: milesInputDouble,
          fuelConsumedInput: state.fuelConsumedInput,
          allTrips: state.allTrips,
        );
      }
    } else if (event is FuelConsumedChangedEvent) {
      double? fuelInputDouble = double.tryParse(event.fuelInput);
      if (fuelInputDouble != null) {
        yield ScreenState(
          milesInput: state.milesInput,
          fuelConsumedInput: fuelInputDouble,
          allTrips: state.allTrips,
        );
      }
    } else {
      Trip trip = Trip(
        miles: state.milesInput,
        fuelConsumedInLitres: state.fuelConsumedInput,
      );
      var allTrips = state.allTrips;
      allTrips.add(trip);
      yield ScreenState(
        milesInput: state.milesInput,
        fuelConsumedInput: state.fuelConsumedInput,
        allTrips: allTrips,
      );
    }
  }
}
