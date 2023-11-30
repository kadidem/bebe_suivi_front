import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/DocteurService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DocteurInfo extends StatefulWidget {
  final DocteurModel docteur;

  const DocteurInfo({Key? key, required this.docteur}) : super(key: key);

  @override
  State<DocteurInfo> createState() => _DocteurInfo();
}

class _DocteurInfo extends State<DocteurInfo> {
  final docteurService _docteurService = docteurService();

  @override
  Widget build(BuildContext context) {
    DocteurModel docteur = widget.docteur;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                //mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Header(),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 100,
                      ),
                      Image.asset('/image/docteur-add.png'),
                      const SizedBox(
                        width: 70,
                      ),
                    ],
                  ),
                  Text(
                    'Nom Prenom: ${docteur.nomPrenom}',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Spécialité: ${docteur.specialiter}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Numero du docteur: ${docteur.numero}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Lieu de travail: ${docteur.adresseDuTravail}',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'contact du travail: ${docteur.contactDuTravail}',
                    style: TextStyle(fontSize: 20),
                  ),
                  // Text(
                  //   'Note: ${docteur.nomPrenom}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  // Text(
                  //   'Note: ${docteur.nomPrenom}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  // Text(
                  //   'Note: ${docteur.nomPrenom}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                  // Text(
                  //   'Note: ${docteur.nomPrenom}',
                  //   style: TextStyle(fontSize: 16),
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
