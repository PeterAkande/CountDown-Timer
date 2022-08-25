import 'package:flutter/material.dart';

class DateFormatter {
  final DateTime dateObject;

  DateFormatter({
    required this.dateObject,
  }) {
    getAmOrPm();
  }

  String amOrPm = 'am';

  Map monthsMap = {
    1: 'Jan',
    2: 'Feb',
    3: 'Mar',
    4: 'Apr',
    5: 'May',
    6: 'Jun',
    7: 'Jul',
    8: 'Aug',
    9: 'Sep',
    10: 'Oct',
    11: 'Nov',
    12: 'Dec'
  };

  Map weekDayMap = {
    1: 'Monday',
    2: 'Tuesday',
    3: 'Wednesday',
    4: 'Thursday',
    5: 'Friday',
    6: 'Saturday',
    7: 'Sunday'
  };

  //Get the day of the week in String
  //Can be either if Monday, Tuesday, ...
  String get weekDay => weekDayMap[dateObject.weekday];

  int get year => dateObject.year; //Get the year

  int get minutes => dateObject.minute; //Get the minutes value

  String get month => monthsMap[
      dateObject.month]; //Get the month abbrevation like Jan, Feb, March, ...

  int get monthDigit => dateObject.month;

  int get seconds => dateObject.second;

  getAmOrPm() {
    //Set the current time meridian to post Meridian or am
    if (dateObject.hour > 12) {
      amOrPm = 'pm';
    }
  }

  int get hour {
    //This returns the Hours.. and restructure it to the 12 hour format
    if (dateObject.hour > 12) {
      return dateObject.hour - 12;
    }
    return dateObject.hour;
  }

  int get day => dateObject.day; //Give the day number like 31, 28, 20
}
