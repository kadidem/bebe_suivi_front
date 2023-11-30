import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/GrossesseProvide.dart';
import 'package:bebe_suivi/Page/Patient/Profil.dart';
import 'package:bebe_suivi/Page/Patient/Rappel.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:provider/provider.dart';

class AcceuilPatient extends StatefulWidget {
  const AcceuilPatient({Key? key}) : super(key: key);

  @override
  _AcceuilPatientState createState() => _AcceuilPatientState();
}

class _AcceuilPatientState extends State<AcceuilPatient> {
  DateTime _currentDate = DateTime.now();
  final DateTime _targetDateTime = DateTime.now();
  final GrossesseService grossesseService = GrossesseService();

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

  @override
  Widget build(BuildContext context) {
    final UserModel user =
        Provider.of<UserProvider>(context, listen: false).user!;
    String userName = user.nom_prenom;

    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 80,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Profil()),
                    );
                  },
                  child: Image.asset('assets/image/profil.png'),
                ),
              ),
              SizedBox(
                height: 80,
                //width: MediaQuery.of(context).size.width,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Rappel()),
                    );
                  },
                  child: Image.asset('assets/image/notif.png'),
                ),
              )
            ],
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

                  if (grossesseEnCours == null) {
                    return SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Aucune grossesse en cours.",
                            style: TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Bienvenue $userName",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Naviguer vers la page d'ajout de grossesse
                              // (vous devrez créer cette page)
                            },
                            child: const Text("Ajouter une grossesse"),
                          ),
                          SizedBox(
                              height: 200,
                              width: 200,
                              child:
                                  Image.asset('assets/image/acceuilbebe.png')),
                          Container(
                              alignment: Alignment.center,
                              height: 300,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 249, 246, 246),
                                border: Border.all(color: primary),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: ListView(children: [
                                CarouselSlider(
                                  items: [
                                    Container(
                                      // padding: EdgeInsets.all(5),
                                      // margin: EdgeInsets.all(6.0),
                                      child: Image.asset(
                                          'assets/image/slider.png'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                          'assets/image/slider.png'),
                                    ),
                                    Container(
                                      height: 200,
                                      width: 150,
                                      // margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                        'assets/image/slider.png',
                                      ),
                                    ),
                                    Container(
                                      //margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                          'assets/image/slider.png'),
                                    ),
                                  ],

                                  //Slider Container properties
                                  options: CarouselOptions(
                                    // height: 180.0,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    // aspectRatio: 10 / 12,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 10,
                                // )
                              ])),
                        ],
                      ),
                    );
                  } else {
                    return Column(
                      children: [
                        // const Text(
                        //   "Grossesse avancement",
                        //   style: TextStyle(
                        //     fontSize: 25,
                        //     fontWeight: FontWeight.bold,
                        //   ),
                        // ),
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
                            markedDatesMap: _getMarkedDates(grossesseEnCours),
                            weekendTextStyle: const TextStyle(
                              color: primary,
                            ),
                            thisMonthDayBorderColor: primary,
                            weekFormat: true,
                            height: 180.0,
                            targetDateTime: _targetDateTime,
                            customGridViewPhysics:
                                const NeverScrollableScrollPhysics(),
                            todayTextStyle: const TextStyle(
                              color: primary,
                            ),
                            todayButtonColor:
                                Color.fromARGB(255, 146, 145, 145),
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
                        ),
                        SizedBox(
                            height: 200,
                            width: 200,
                            child: Image.asset('assets/image/acceuilbebe.png')),
                        Container(
                            alignment: Alignment.center,
                            height: 300,
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 249, 246, 246),
                              border: Border.all(color: primary),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: ListView(
                              children: [
                                CarouselSlider(
                                  items: [
                                    Container(
                                      // padding: EdgeInsets.all(5),
                                      // margin: EdgeInsets.all(6.0),
                                      child: Image.asset(
                                          'assets/image/slider.png'),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                          'assets/image/slider.png'),
                                    ),
                                    Container(
                                      height: 200,
                                      width: 150,
                                      // margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                        'assets/image/slider.png',
                                      ),
                                    ),
                                    Container(
                                      //margin: EdgeInsets.all(6.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Image.asset(
                                          'assets/image/slider.png'),
                                    ),
                                  ],

                                  //Slider Container properties
                                  options: CarouselOptions(
                                    // height: 180.0,
                                    enlargeCenterPage: true,
                                    autoPlay: true,
                                    // aspectRatio: 10 / 12,
                                    autoPlayCurve: Curves.fastOutSlowIn,
                                    enableInfiniteScroll: true,
                                    autoPlayAnimationDuration:
                                        const Duration(milliseconds: 800),
                                    viewportFraction: 0.8,
                                  ),
                                ),
                              ],
                            ))
                      ],
                    );
                  }
                }
              }),
        ]),
      ))),
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
