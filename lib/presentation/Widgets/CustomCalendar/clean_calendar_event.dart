import 'package:flutter/material.dart';

import 'flutter_clean_calendar.dart';

class CleanCalendarEvent {
  String summary;
  String description;
  String location;
  DateTime startTime;
  DateTime endTime;
  Color color;
  bool isAllDay;
  bool isDone;
  TypeDay typeDay;

  CleanCalendarEvent(this.summary,
      {this.description = '',
        this.location = '',
        @required this.startTime,
        @required this.endTime,
        @required this.typeDay,
        this.color = Colors.blue,
        this.isAllDay = false,
        this.isDone = false});
}