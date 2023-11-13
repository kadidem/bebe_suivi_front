import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';

// StatefulWidget
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
// created controller
  DateTime _currentDate = DateTime.now();
  final DateTime _targetDateTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    initializeDateFormatting('fr_FR', null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        child: const Header(),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        height: 60,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(color: const Color.fromARGB(255, 241, 157, 157)),
          //borderRadius: BorderRadius.circular(10.0),
        ),
        child: const Text(
          "Semaine 5",
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
      ),
      CalendarCarousel(
        onDayPressed: (DateTime date, List<Event> events) {
          setState(() {
            _currentDate = date;
          });
        },
        weekendTextStyle: const TextStyle(
          color: primary,
        ),

        thisMonthDayBorderColor: primary,
        weekFormat: false,
        height: 420.0,
        selectedDateTime: _currentDate,
        targetDateTime: _targetDateTime,
        customGridViewPhysics: NeverScrollableScrollPhysics(),
        todayTextStyle: TextStyle(
          color: primary,
        ),
        markedDatesMap: _getMarkedDates(),
        //todayButtonColor: Colors.transparent,
        todayBorderColor: Color.fromARGB(255, 249, 122, 122),
        markedDateMoreShowTotal: true,
      ),
    ]));
  }

  EventList<Event> _getMarkedDates() {
    EventList<Event> markedDates = EventList<Event>(events: {});

    markedDates.add(
      DateTime.now().add(Duration(days: 2)),
      Event(
        date: DateTime.now().add(Duration(days: 2)),
        icon: Container(color: primary),
      ),
    );
    markedDates.add(
      DateTime.now().add(Duration(days: 5)),
      Event(
        date: DateTime.now().add(Duration(days: 5)),
        icon: Container(color: primary),
      ),
    );
    markedDates.add(
      DateTime.now().add(Duration(days: 10)),
      Event(
        date: DateTime.now().add(Duration(days: 10)),
        icon: Container(color: Colors.red),
      ),
    );

    return markedDates;
  }
}
