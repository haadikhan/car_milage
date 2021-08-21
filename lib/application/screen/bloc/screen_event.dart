part of 'screen_bloc.dart';

@immutable
abstract class ScreenEvent {}

class MilesChangedEvent extends ScreenEvent {
  final String milesInput;
  MilesChangedEvent(this.milesInput);
}

class FuelConsumedChangedEvent extends ScreenEvent {
  final String fuelInput;
  FuelConsumedChangedEvent(this.fuelInput);
}

class AddTripPressedEvent extends ScreenEvent {}
