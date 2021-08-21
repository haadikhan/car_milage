import 'package:car_milage/application/screen/bloc/screen_bloc.dart';
import 'package:car_milage/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScreenBloc, ScreenState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Car mileage program'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AddTripForm(),
                Expanded(
                  child: TripsListView(),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AddTripForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Enter new trip data below'),
        TextFormField(
          decoration: InputDecoration(hintText: 'Enter miles'),
          onChanged: (val) {
            context.read<ScreenBloc>().add(
                  MilesChangedEvent(val),
                );
          },
        ),
        TextFormField(
          decoration: InputDecoration(hintText: 'Enter fuel consumed'),
          onChanged: (val) {
            context.read<ScreenBloc>().add(
                  FuelConsumedChangedEvent(val),
                );
          },
        ),
        MaterialButton(
          child: Text('Add Trip'),
          color: Colors.blue,
          onPressed: () {
            context.read<ScreenBloc>().add(AddTripPressedEvent());
          },
        ),
      ],
    );
  }
}

class TripsListView extends StatelessWidget {
  const TripsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScreenBloc, ScreenState>(
      builder: (context, state) {
        return Column(
          children: [
            Text('All Trips'),
            Expanded(
              child: ListView.builder(
                  itemCount: state.allTrips.length,
                  itemBuilder: (_, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('miles: ${state.allTrips[index].miles}'),
                        Text(
                            'fuel consumed: ${state.allTrips[index].fuelConsumedInLitres}'),
                        Text(
                            'mileage: ${state.allTrips[index].calculateMilage()}')
                      ],
                    );
                  }),
            )
          ],
        );
      },
    );
  }
}
