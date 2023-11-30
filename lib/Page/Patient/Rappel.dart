import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class Rappel extends StatefulWidget {
  const Rappel({super.key});

  @override
  State<Rappel> createState() => _RappelState();
}

class _RappelState extends State<Rappel> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: const Header(),
                    ),
                    Container(
                      width: 200,
                      height: 150,
                      child: Image.asset("assets/image/rappel.png"),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Container(
                          // height: 120,
                          // width: 550,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 209, 203, 203),
                            border: Border.all(color: primary),
                            borderRadius: BorderRadius.circular(10.0),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     offset: Offset(0, 5),
                            //     blurRadius: 3.0,
                            //   ),
                            // ],
                          ),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Rappel pour prise de medicamant",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        // Afficher le popup
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              alignment: Alignment.center,
                                              backgroundColor: Colors.white,
                                              title: const Text(
                                                'Confirmation de suppression',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              content: const Text(
                                                'Êtes-vous sûr de vouloir supprimer ?',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontSize: 18,
                                                ),
                                              ),
                                              actions: [
                                                TextButton(
                                                    onPressed: () {
                                                      // Annuler la suppression
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      6),
                                                          width: 100,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            border: Border.all(
                                                                color: primary),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: const Text(
                                                            'Annuler',
                                                            style: TextStyle(
                                                                //color: Colors.white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                                TextButton(
                                                    onPressed: () {
                                                      // Ajoutez ici la logique pour la suppression
                                                      // Après la suppression, fermer le popup
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: Column(
                                                      children: [
                                                        Container(
                                                          alignment:
                                                              Alignment.center,
                                                          margin:
                                                              const EdgeInsets
                                                                  .symmetric(
                                                                  vertical: 10,
                                                                  horizontal:
                                                                      6),
                                                          width: 100,
                                                          height: 50,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: primary,
                                                            border: Border.all(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    255,
                                                                    255,
                                                                    255)),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: const Text(
                                                            'Supprimer',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16),
                                                          ),
                                                        )
                                                      ],
                                                    )),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      child: Image.asset(
                                          'assets/image/poubelle.png'),
                                    ),
                                  ],
                                ),
                                const Text(
                                    "Il est l’heure de prendre votre medicaments"),
                                const Text("2023/10/12 a 8h00"),
                              ]),
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                        child: Container(
                          // height: 120,
                          // width: 550,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: primary),
                            borderRadius: BorderRadius.circular(10.0),
                            // boxShadow: const [
                            //   BoxShadow(
                            //     color: Colors.grey,
                            //     offset: Offset(0, 5),
                            //     blurRadius: 3.0,
                            //   ),
                            // ],
                          ),

                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    const Text(
                                      "Rappel pour Rendez-vous medicale",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // const SizedBox(
                                    //   width: 20,
                                    // ),
                                    Image.asset("assets/image/poubelle.png")
                                  ],
                                ),
                                const Text(
                                    "Demain vous avez rendez-vous avec votre docteur à 10h00"),
                                const Text("2023/10/12 a 8h00"),
                              ]),
                        ))
                  ],
                ),
              ],
            ),
            Positioned(
              top: 16, // Ajustez ces valeurs selon votre mise en page
              left: 16,
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    ));
  }
}
