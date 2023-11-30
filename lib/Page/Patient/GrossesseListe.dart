// import 'dart:convert';

import 'dart:convert';

import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Page/GrossesseProvide.dart';
import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
// import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GrossesseListe extends StatefulWidget {
  GrossesseListe({super.key});
  // final GrossesseService service = GrossesseService();
  @override
  State<GrossesseListe> createState() => _GrossesseListeState();
}

class _GrossesseListeState extends State<GrossesseListe> {
  final GrossesseService service = GrossesseService();
  late List<GrossesseModel> listegros;
  Future<List<GrossesseModel>> listGrossesse = Future.value([]);
  @override
  void initState() {
    listGrossesse = service.getAllGrossesseByIdUser(
      Provider.of<UserProvider>(context, listen: false).user?.idUser ?? 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        child: const Header(),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Image.asset(
          'assets/image/grossesse1.png',
        ),
      ),
      FutureBuilder<List<GrossesseModel>>(
        future: listGrossesse,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Erreur: ${snapshot.error}');
          } else {
            List<GrossesseModel> grossesses = snapshot.data!;
            // Provider.of<GrossesseProvider>(context, listen: false)
            //     .setListeGrossesses(grossesses);
            Provider.of<GrossesseProvider>(context, listen: false)
                .listeGrossesses = grossesses;

            return Column(
              children: grossesses.map((grossesse) {
                bool estTerminee = grossesse.dateAcouchement != null &&
                    grossesse.dateAcouchement!.isBefore(DateTime.now());
                print('Response: ${jsonEncode(grossesse.toJson())}');
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: estTerminee
                        ? Color.fromARGB(255, 230, 226, 226)
                        : Colors.white,
                    border: Border.all(color: primary),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: Text(
                          "Grossesse ${grossesse.idGrossesse}", // Assurez-vous que votre modèle a une propriété 'numero'
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          "Date de début: ${grossesse.dateDernierRegle.toString()}", // Assurez-vous que votre modèle a une propriété 'dateDebut'
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          estTerminee ? "Terminée" : "En cours",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          }
        },
      ),
      CustomButton(
        text: "Ajouter",
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Grossesse()),
          );
        },
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
    ]))));
  }
}
