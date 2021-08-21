import 'package:car_milage/car.dart';
import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  Car car = Car();
  TextEditingController milesTextController = TextEditingController();
  TextEditingController petrolTextController = TextEditingController();
  double sum = 0;
  double average = 0;
  double mileage = 0;
  var mileageRecord = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            TextField(
              controller: milesTextController,
              decoration: InputDecoration(hintText: 'miles driven'),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: petrolTextController,
              decoration: InputDecoration(hintText: 'petrol in liter'),
            ),
            // TextField(
            //   controller: tripsTextController,
            // ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                mileage = car.calculateMilage(
                    double.parse(milesTextController.text),
                    double.parse(petrolTextController.text));
                mileageRecord.add(mileage);

                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Calculate  instant milage',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  mileage.toStringAsPrecision(5),
                  style: TextStyle(fontSize: 20),
                )),
            Text('total trips   ' + mileageRecord.toString()),

            SizedBox(
              height: 40,
            ),

            InkWell(
              onTap: () {
                _averageMileageRecord();
                setState(() {});
              },
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                ),
                child: Text(
                  'Calculate average milage of all trips',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                padding: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  average.toStringAsPrecision(5),
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }

  double _averageMileageRecord() {
    sum = mileageRecord.reduce((value, element) => value + element);
    average = sum / mileageRecord.length;

    return average;
  }
}
