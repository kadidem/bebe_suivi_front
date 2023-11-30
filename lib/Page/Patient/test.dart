import 'dart:ui';

import 'package:bebe_suivi/Page/Patient/AddRendezvous.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class MyCalendarScreen extends StatefulWidget {
  @override
  _MyCalendarScreenState createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyCalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  EventList<Event> _markedDates = EventList<Event>(events: {});

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
    _markedDates = EventList<Event>(events: {});
  }

  void _handleDateSelection(DateTime date) {
    setState(() {
      _selectedDate = date;
      _markedDates.add(
        _selectedDate,
        Event(
          date: _selectedDate,
          icon: Container(color: primary),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // Set aspect ratio here
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),

        child: CalendarCarousel(
          locale: 'fr_FR',
          onDayPressed: (DateTime date, List<Event> events) {
            setState(() {
              _selectedDate = date;
            });
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    AddRendezvous(selectedDate: _selectedDate),
              ),
            );
            // _showAddRendezvousForm();
          },
          weekendTextStyle: TextStyle(
            color: primary,
          ),
          headerTextStyle: TextStyle(color: Colors.black),
          thisMonthDayBorderColor: Colors.black,
          iconColor: Colors.black,
          daysHaveCircularBorder: false,
          markedDatesMap: _markedDates,
          markedDateIconBorderColor: primary,
          height: 420.0,
          selectedDateTime: _selectedDate,
          targetDateTime: _selectedDate,
          customGridViewPhysics: const NeverScrollableScrollPhysics(),
          selectedDayButtonColor: primary,
          markedDateWidget: Positioned(
              child: Container(
                  color: Color.fromARGB(234, 225, 150, 133),
                  height: 4.0,
                  width: 4.0),
              bottom: 4.0,
              left: 18.0),
          // dayButtonColor: Colors.grey,
        ),
      ),
    );
  }
}
