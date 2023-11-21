import 'package:bebe_suivi/Page/Patient/BebeAcceuil.dart';
import 'package:bebe_suivi/Page/Patient/BebeAdd.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Bebe extends StatefulWidget {
  const Bebe({Key? key}) : super(key: key);

  @override
  State<Bebe> createState() => _BebeState();
}

class _BebeState extends State<Bebe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(children: [
        Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Header(),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                'assets/image/bebeadd.png',
              )),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              width: 250,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: primary),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: GestureDetector(onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BebeAcceuil()),
                );
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Kaidia Diarra",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Image.asset('assets/image/modifier.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "12/10/2023       F",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
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
                                        fontWeight: FontWeight.bold),
                                  ),
                                  content: const Text(
                                    'Êtes-vous sûr de vouloir supprimer cet Bebe ?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 18,
                                    ),
                                  ),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          // Annuler la suppression
                                          Navigator.of(context).pop();
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 6),
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                border:
                                                    Border.all(color: primary),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: const Text(
                                                'Annuler',
                                                style: TextStyle(
                                                    //color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            )
                                          ],
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          // Ajoutez ici la logique pour la suppression
                                          // Après la suppression, fermer le popup
                                          Navigator.of(context).pop();
                                        },
                                        child: Column(
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10,
                                                      horizontal: 6),
                                              width: 100,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                color: primary,
                                                border: Border.all(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255)),
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: const Text(
                                                'Supprimer',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
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
                          child: Image.asset('assets/image/poubelle.png'),
                        ),
                      ],
                    ),
                  ],
                );
              })),
          CustomButton(
            text: "Ajouter",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const BebeAdd()),
              );
            },
          )
        ]),
        Positioned(
          top: 200,
          right: 0,
          child: Image.asset("assets/image/tetine.png"),
        ),
        Positioned(
          top: 500,
          right: 20,
          child: Image.asset("assets/image/biberon.png"),
        ),
        Positioned(
          top: 700,
          right: 20,
          child: Image.asset(
            "assets/image/pied.png",
            width: 60,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6,
          left: 20,
          child: Image.asset(
            "assets/image/pied.png",
            width: 60,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 20,
          child: Image.asset(
            "assets/image/berceau.png",
            width: 90,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.7,
          left: 60,
          child: Image.asset(
            "assets/image/berceau.png",
            width: 90,
          ),
        ),
        Positioned(
          top: 16, // Ajustez ces valeurs selon votre mise en page
          left: 16,
          child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
      ]),
    ));
  }
}
