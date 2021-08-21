class Trip {
  final double miles;
  final double fuelConsumedInLitres;

  Trip({
    required this.miles,
    required this.fuelConsumedInLitres,
  });

  double calculateMilage() {
    return miles / fuelConsumedInLitres;
  }
}
