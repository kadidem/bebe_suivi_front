import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Page/Patient/MedicamentAdd.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/MedicamentService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Medicament extends StatelessWidget {
  Medicament({super.key});
  final MedicamentService service = MedicamentService();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Header(),
        ),
        Container(
            padding: const EdgeInsets.only(left: 300),
            child: GestureDetector(
                onTap: () {
                  // Utiliser Navigator.push pour naviguer vers la nouvelle page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MedicamentAdd()),
                  );
                },
                child: Image.asset("assets/image/plus.png"))),
        FutureBuilder<List<MedicamentModel>>(
          future: service.getAllMedicaments(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erreur: ${snapshot.error}');
            } else {
              // Affichez la liste des médicaments
              List<MedicamentModel> medicaments = snapshot.data!;
              return Column(
                children: medicaments.map((medicament) {
                  return Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                    width: 340,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset(0, 10),
                          blurRadius: 5.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              height: 60,
                              width: 60,
                              child: Image.asset('assets/image/medicament.png'),
                            ),
                            const SizedBox(width: 30),
                            Text(
                              medicament.nom,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                            const SizedBox(width: 30),
                            InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   // context,
                                //   // MaterialPageRoute(
                                //   //   builder: (context) =>
                                //   //       MedicamentForm(medicament: medicament),
                                //   // ),
                                // );
                              },
                              child: Image.asset('assets/image/modifier.png'),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                // Ajoutez ici la logique pour la suppression
                              },
                              child: Image.asset('assets/image/poubelle.png'),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const SizedBox(width: 80),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                color: primary,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                ' ${medicament.nbreDeJour} FOIS PAR JOURS',
                                // Vous devez obtenir cette information du modèle MedicamentModel
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            const SizedBox(width: 30),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 6, horizontal: 2),
                              height: 60,
                              width: 100,
                              decoration: BoxDecoration(
                                color: primary,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Text(
                                'PENDANT ${medicament.nombrePrises} JOURS',
                                // Vous devez obtenir cette information du modèle MedicamentModel
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }).toList(),
              );
            }
          },
        ),
      ]),
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
    ])));
  }
}
