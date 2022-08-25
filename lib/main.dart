import 'dart:async';

import 'package:flutter/material.dart';

import 'data_formatter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DateTime setDateDetails = DateTime(2022, 9, 30, 16, 30, 59); // The due date
  late final int setDateDetailsEpoch;

  late DateFormatter dateFormatter;

  void calculateRemainingDate() {
    int currentDateDetailsEpoch = DateTime.now().millisecondsSinceEpoch;

    int remainingCountDown = setDateDetailsEpoch - currentDateDetailsEpoch;

    DateTime remainingCountDownDateDetails =
        DateTime.fromMillisecondsSinceEpoch(remainingCountDown);
    dateFormatter = DateFormatter(dateObject: remainingCountDownDateDetails);
  }

  @override
  void initState() {
    super.initState();
    setDateDetailsEpoch = setDateDetails.millisecondsSinceEpoch;
    calculateRemainingDate();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        calculateRemainingDate(); //Calculate the date after one second
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('Count down Timer'),
        ),
        body:  Center(
          child: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Time Remaining', style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 35),),
                Text('${dateFormatter.monthDigit} Months', style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 28),),
                Text('${dateFormatter.day} days', style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 28)),
                Text('${dateFormatter.hour} Hours', style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 28)),
                Text('${dateFormatter.minutes} Minutes', style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 28)),
                Text('${dateFormatter.seconds} Seconds', style: Theme.of(context).textTheme.headline2?.copyWith(fontSize: 28)),
               
              ],
            ),
          ),
        ));
  }
}
