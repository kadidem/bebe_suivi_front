import 'package:bebe_suivi/Page/Choix.dart';
import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
// import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/material.dart';

class Demarrage extends StatefulWidget {
  const Demarrage({super.key});

  @override
  State<Demarrage> createState() => _DemarrageState();
}

class _DemarrageState extends State<Demarrage> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 7),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Choix(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Header(),
          ),
          const Text(
            "Bienvenue à bébé suivie ",
            style: TextStyle(
              fontSize: 26, // Taille de la police
              fontWeight: FontWeight.bold, // Gras
              fontStyle: FontStyle.italic, // Italique
            ),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/image/logo.png',
              )),
          // const Text("Parce que chaque mère mérite un suivi de grossesse de première classe. ",
          const Text(
            "Parce que chaque mère mérite un suivi de grossesse de première classe. ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
