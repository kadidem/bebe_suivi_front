import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Page/Patient/MedicamentAdd.dart';
import 'package:bebe_suivi/Page/Patient/MedicamentEdit.dart';
import 'package:bebe_suivi/Page/Patient/MedicamentProvider.dart';
//import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/MedicamentService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Medicament extends StatefulWidget {
  Medicament({super.key});

  @override
  State<Medicament> createState() => _MedicamentState();
}

class _MedicamentState extends State<Medicament> {
  final MedicamentService service = MedicamentService();

  Future<List<MedicamentModel>> listMedicament = Future.value([]);

  @override
  void initState() {
    listMedicament = service.getAllMedicamentByIdUser(
      Provider.of<UserProvider>(context, listen: false).user?.idUser ?? 0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Stack(children: [
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
                      MaterialPageRoute(builder: (context) => MedicamentAdd()),
                    );
                  },
                  child: Image.asset("assets/image/plus.png"))),
          FutureBuilder<List<MedicamentModel>>(
            future: listMedicament,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return Text('Erreur: ${snapshot.error}');
              } else {
                List<MedicamentModel> medicaments = snapshot.data!;

                Provider.of<MedicamentProvider>(context, listen: false)
                    .listeMedicament = medicaments;

                return Column(
                  children: medicaments.map((medicament) {
                    print(medicament.nbreDeJour);
                    print(medicament.nombrePrises);
                    return Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 6),
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
                                child:
                                    Image.asset('assets/image/medicament.png'),
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => MedicamentEdit(
                                          medicament: medicament),
                                    ),
                                  );
                                },
                                child: Image.asset('assets/image/modifier.png'),
                              ),
                              const SizedBox(width: 8),
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
                                          'Êtes-vous sûr de vouloir supprimer cet Mediment ?',
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
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10,
                                                        horizontal: 6),
                                                    width: 100,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          color: primary),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: const Text(
                                                      'Annuler',
                                                      style: TextStyle(
                                                          //color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                                    margin: const EdgeInsets
                                                        .symmetric(
                                                        vertical: 10,
                                                        horizontal: 6),
                                                    width: 100,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      color: primary,
                                                      border: Border.all(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              255, 255, 255)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: const Text(
                                                      'Supprimer',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
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
                                  ' ${medicament.nombrePrises} FOIS PAR JOURS',
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
                                  'PENDANT ${medicament.nbreDeJour} JOURS',
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
      ]),
    )));
  }
}
