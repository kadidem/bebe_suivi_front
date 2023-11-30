import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Page/GrossesseProvide.dart';
import 'package:bebe_suivi/Page/Patient/AddRendezvous.dart';
import 'package:bebe_suivi/Page/Patient/DocteurInfo.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/DocteurService.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:provider/provider.dart';

// StatefulWidget
class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final docteurService _docteurService = docteurService();

  DateTime _currentDate = DateTime.now();
  final DateTime _targetDateTime = DateTime.now();
  // @override
  // void initState() {
  //   super.initState();
  //   initializeDateFormatting('fr_FR', null);
  // }

  @override
  void initState() {
    super.initState();
    loadCurrentPregnancy();
  }

  void loadCurrentPregnancy() async {
    try {
      GrossesseModel? grossesseEnCours =
          await grossesseService.getGrossesseEnCours(
        Provider.of<UserProvider>(context, listen: false).user?.idUser ?? 0,
      );

      setState(() {
        if (grossesseEnCours != null) {
          context.read<GrossesseProvider>().grossesseEnCours = grossesseEnCours;
        }
      });
    } catch (e) {
      print('Erreur lors du chargement de la grossesse en cours : $e');
    }
  }

  final GrossesseService grossesseService = GrossesseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: const Header(),
            ),
            FutureBuilder<GrossesseModel?>(
              future: grossesseService.getGrossesseEnCours(
                Provider.of<UserProvider>(context, listen: false)
                        .user
                        ?.idUser ??
                    0,
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  print('Erreur: ${snapshot.error}');
                  return Container();
                } else {
                  GrossesseModel? grossesseEnCours = snapshot.data;

                  return Column(children: [
                    // Display the weeks information
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 2),
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 241, 157, 157)),
                        //borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        'Semaine ${_calculateWeeksSinceStart(grossesseEnCours)}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),

                    Text(
                      'Grossesse avancement semaine ${_calculateWeeksSinceStart(grossesseEnCours)}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      //: 500,
                      child: CalendarCarousel(
                        headerTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black,
                        ),
                        iconColor: primary,
                        locale: 'fr_FR',
                        onDayPressed: (DateTime date, List<Event> events) {
                          setState(() {
                            _currentDate = date;
                          });
                        },
                        markedDatesMap: _getMarkedDates(grossesseEnCours!),
                        weekendTextStyle: const TextStyle(
                          color: primary,
                        ),
                        thisMonthDayBorderColor: primary,
                        weekFormat: false,
                        height: 500.0,
                        targetDateTime: _targetDateTime,
                        customGridViewPhysics:
                            const NeverScrollableScrollPhysics(),
                        todayTextStyle: const TextStyle(
                          color: primary,
                        ),
                        todayButtonColor: Color.fromARGB(255, 146, 145, 145),
                        todayBorderColor: Colors.black,
                        markedDateMoreShowTotal: true,
                        customDayBuilder: (
                          bool isSelectable,
                          int index,
                          bool isSelectedDay,
                          bool isToday,
                          bool isPrevMonthDay,
                          TextStyle textStyle,
                          bool isNextMonthDay,
                          bool isThisMonthDay,
                          DateTime day,
                        ) {
                          bool shouldBeHighlighted =
                              _shouldHighlightDate(day, grossesseEnCours);

                          if (shouldBeHighlighted) {
                            return Center(
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primary,
                                  border: Border.all(
                                    color: Colors.white,
                                    width: 2.0,
                                  ),
                                ),
                                child: Center(
                                  child: Text(
                                    '${day.day}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: Text('${day.day}', style: textStyle),
                            );
                          }
                        },
                        maxSelectedDate: DateTime.now(),
                      ),
                    )
                  ]);
                }
              },
            ),
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Listes de docteur",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            FutureBuilder<List<DocteurModel>>(
                future: _docteurService.getAllDocteurs(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Erreur: ${snapshot.error}');
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Text('Aucun docteur trouvé.');
                  } else {
                    List<DocteurModel> docteurs = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: docteurs.length,
                        itemBuilder: (context, index) {
                          DocteurModel docteur = docteurs[index];
                          return GestureDetector(
                              onTap: () {
                                // Naviguer vers la page DocteurInfo avec les informations du docteur
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DocteurInfo(docteur: docteur),
                                  ),
                                );
                              },
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  child: Container(
                                      height: 90,
                                      width: 400,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: primary),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(40.0),
                                            ),
                                            child: Image.asset(
                                                "assets/image/docteur.png"),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                docteur.nomPrenom ?? "",
                                                style: const TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Text(
                                                docteur.specialiter ?? "",
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Image.asset("assets/image/plus.png")
                                        ],
                                      ))));
                        });
                  }
                })
          ],
        ),
      ),
    );
  }

  int _calculateWeeksSinceStart(GrossesseModel? grossesseEnCours) {
    if (grossesseEnCours == null) {
      return 0;
    }

    DateTime startDate = DateTime.parse(grossesseEnCours.dateDernierRegle);
    return DateTime.now().difference(startDate).inDays ~/ 7;
  }

  bool _shouldHighlightDate(DateTime date, GrossesseModel? grossesseEnCours) {
    if (grossesseEnCours == null) {
      return false;
    }

    DateTime startDate = DateTime.parse(grossesseEnCours.dateDernierRegle);
    return date.isAfter(startDate) && !date.isAfter(DateTime.now());
  }

  EventList<Event> _getMarkedDates(GrossesseModel grossesseEnCours) {
    EventList<Event> markedDates = EventList<Event>(events: {});

    DateTime dateDebutGrossesse =
        DateTime.parse(grossesseEnCours.dateDernierRegle);
    DateTime? dateFinGrossesse = grossesseEnCours.dateAcouchement;

    for (DateTime date = dateDebutGrossesse;
        date.isBefore(dateFinGrossesse!);
        date = date.add(const Duration(days: 1))) {
      markedDates.add(
        date,
        Event(
          date: date,
          icon: Container(
            color: const Color.fromARGB(255, 25, 3, 3),
          ),
        ),
      );
    }

    if (grossesseEnCours.dateAcouchement != null &&
        !grossesseEnCours.dateAcouchement!.isBefore(DateTime.now())) {
      markedDates.add(
        grossesseEnCours.dateAcouchement!,
        Event(
          date: grossesseEnCours.dateAcouchement!,
          icon: Container(
            color: const Color.fromARGB(255, 243, 33, 33),
          ),
        ),
      );
    }

    return markedDates;
  }
}
