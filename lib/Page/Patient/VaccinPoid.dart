import 'package:bebe_suivi/Page/Patient/PoidListe.dart';
import 'package:bebe_suivi/Page/Patient/VaccinListe.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class VaccinPoid extends StatefulWidget {
  const VaccinPoid({super.key});

  @override
  State<VaccinPoid> createState() => _VaccinPoidState();
}

class _VaccinPoidState extends State<VaccinPoid> {
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
            GestureDetector(
              onTap: () {
                // Utiliser Navigator.push pour naviguer vers la nouvelle page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VaccinListe()),
                );
              },
              child: SizedBox(
                  width: 280,
                  height: 250,
                  // width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/image/polio.png',
                  )),
            ),
            // const Text("Parce que chaque mère mérite un suivi de grossesse de première classe. ",
            const Text(
              "Vaccin ",
              style: TextStyle(
                fontSize: 26, // Taille de la police
                fontWeight: FontWeight.bold, // Gras
                fontStyle: FontStyle.italic, // Italique
              ),
            ),
            GestureDetector(
              onTap: () {
                // Utiliser Navigator.push pour naviguer vers la nouvelle page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PoidListe()),
                );
              },
              child: SizedBox(
                  width: 280,
                  height: 250,
                  //: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/image/balance.png',
                  )),
            ),

            const Text(
              "Poids ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                //fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
