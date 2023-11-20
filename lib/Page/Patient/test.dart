import 'dart:ui';

import 'package:bebe_suivi/Page/Patient/AddRendezvous.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

class MyCalendarScreen extends StatefulWidget {
  @override
  _MyCalendarScreenState createState() => _MyCalendarScreenState();
}

class _MyCalendarScreenState extends State<MyCalendarScreen> {
  DateTime _selectedDate = DateTime.now();
  //DateTime _selectedDate;
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
      // Ajoute un événement pour la date sélectionnée avec une icône de couleur primaire.
      _markedDates.add(
        _selectedDate,
        Event(
          date: _selectedDate,
          icon: Container(color: Colors.blue),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar with Events'),
      ),
      body: Column(
        children: [
          CalendarCarousel(
            onDayPressed: (DateTime date, List<Event> events) {
              setState(() {
                _selectedDate = date;
              });

              // Afficher le formulaire d'ajout de rendez-vous
              _showAddRendezvousForm();
            },
            weekendTextStyle: TextStyle(
              color: Colors.red,
            ),
            thisMonthDayBorderColor: Colors.grey,
            daysHaveCircularBorder: true,
            markedDatesMap: _markedDates,
            height: 420.0,
            selectedDateTime: _selectedDate,
            targetDateTime: _selectedDate,
          ),
        ],
      ),
    );
  }

  void _showAddRendezvousForm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ajouter un rendez-vous'),
          content: AddRendezvous(selectedDate: _selectedDate),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fermer'),
            ),
          ],
        );
      },
    );
  }
}
