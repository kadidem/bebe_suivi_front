import 'package:bebe_suivi/Page/Patient/AcceuilPatient.dart';
import 'package:bebe_suivi/Page/Patient/Bebe.dart';
import 'package:bebe_suivi/Page/Patient/Docteur.dart';
import 'package:bebe_suivi/Page/Patient/Forum.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseListe.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:bebe_suivi/Page/Patient/Rdv.dart';
import 'package:bebe_suivi/Page/Patient/Grossesse.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  //const Navigation({super.key});
  int pageIndex = 0;

  final pages = [
    const AcceuilPatient(),
    GrossesseListe(),
    const Bebe(),
    Medicament(),
    const Rdv(),
    const Docteur(),
    const Forum(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 0;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 0
                      ? Image.asset(
                          'assets/image/home.png',
                          width: 35,
                          height: 35,
                        )
                      : Image.asset(
                          'assets/image/home.png',
                          width: 35,
                          height: 35,
                        ),
                  const Text("Acceuil")
                ],
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 1
                      ? Image.asset(
                          'assets/image/bebe.png',
                          width: 35,
                          height: 35,
                        )
                      : Image.asset(
                          'assets/image/bebe.png',
                          width: 35,
                          height: 35,
                        ),
                  const Text("Grossesse")
                ],
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 2
                      ? Image.asset(
                          'assets/image/logo.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                          //color: Colors.white,
                          width: 35,
                          height: 35,
                        )
                      : Image.asset(
                          'assets/image/logo.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                          //  color: Colors.white,
                          width: 35,
                          height: 35,
                        ),
                  const Text("Bébé")
                ],
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 3
                      ? Image.asset(
                          'assets/image/medicament.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                          // color: Colors.white,
                          width: 35,
                          height: 35,
                        )
                      : Image.asset(
                          'assets/image/medicament.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                          //color: Colors.white,
                          width: 35,
                          height: 35,
                        ),
                  const Text("Medicament")
                ],
              ),
            ),
            //= IconButton(
            //   enableFeedback: false,
            //   onPressed: () {
            //     setState(() {
            //       pageIndex = 4;
            //     });
            //   },
            //   icon: Column(
            //     children: [
            //       pageIndex == 5
            //           ? Image.asset(
            //               'assets/image/docteur.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
            //               // color: Colors.white,
            //               width: 35,
            //               height: 35,
            //             )
            //           : Image.asset(
            //               'assets/image/docteur.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
            //               //color: Colors.white,
            //               width: 35,
            //               height: 35,
            //             ),
            //       const Text("Docteur")
            //     ],
            //   ),
            // ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 5;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 5
                      ? Image.asset(
                          'assets/image/rdv.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                          // color: Colors.white,
                          width: 35,
                          height: 35,
                        )
                      : Image.asset(
                          'assets/image/rdv.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                          //color: Colors.white,
                          width: 35,
                          height: 35,
                        ),
                  const Text("RDV")
                ],
              ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 6;
                });
              },
              icon: Column(
                children: [
                  pageIndex == 6
                      ? Image.asset(
                          'assets/image/forum.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                          // color: Colors.white,
                          width: 35,
                          height: 35,
                        )
                      : Image.asset(
                          'assets/image/forum.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                          //color: Colors.white,
                          width: 35,
                          height: 35,
                        ),
                  const Text("Forum")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
