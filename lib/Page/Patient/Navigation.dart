import 'package:bebe_suivi/Page/Patient/AcceuilPatient.dart';
import 'package:bebe_suivi/Page/Patient/Bebe.dart';
import 'package:bebe_suivi/Page/Patient/Docteur.dart';
import 'package:bebe_suivi/Page/Patient/Forum.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:bebe_suivi/Page/Patient/Rdv.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
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
    const Bebe(),
    const Docteur(),
    const Forum(),
    const Grossesse(),
    const Medicament(),
    const Rdv(),
  ];

  @override
  Widget build(BuildContext context) {
    Color mycolors = const Color(0xFFF28482);
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: mycolors,
          borderRadius: const BorderRadius.only(
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
              icon: pageIndex == 0
                  ? Image.asset(
                      'assets/image/home.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                      // color: Colors.white,
                      width: 35,
                      height: 35,
                    )
                  : Image.asset(
                      'assets/image/home.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                      //color: Colors.white,
                      width: 35,
                      height: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 1;
                });
              },
              icon: pageIndex == 1
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
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 2;
                });
              },
              icon: pageIndex == 2
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
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 3;
                });
              },
              icon: pageIndex == 3
                  ? Image.asset(
                      'assets/image/bebe.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                      // color: Colors.white,
                      width: 35,
                      height: 35,
                    )
                  : Image.asset(
                      'assets/image/bebe.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                      //color: Colors.white,
                      width: 35,
                      height: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 4;
                });
              },
              icon: pageIndex == 5
                  ? Image.asset(
                      'assets/image/docteur.png', // Remplacez 'assets/home_filled.png' par le chemin de votre image
                      // color: Colors.white,
                      width: 35,
                      height: 35,
                    )
                  : Image.asset(
                      'assets/image/docteur.png', // Remplacez 'assets/home_outlined.png' par le chemin de votre image
                      //color: Colors.white,
                      width: 35,
                      height: 35,
                    ),
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 5;
                });
              },
              icon: pageIndex == 5
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
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                setState(() {
                  pageIndex = 6;
                });
              },
              icon: pageIndex == 6
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
            ),
          ],
        ),
      ),
    );
  }
}
