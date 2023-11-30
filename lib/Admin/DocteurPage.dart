import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Service/AdminService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class DocteurPage extends StatefulWidget {
  const DocteurPage({super.key});

  @override
  State<DocteurPage> createState() => _DocteurPageState();
}

bool isChecked = false;
//late List<DocteurModel> docteurs;

class _DocteurPageState extends State<DocteurPage> {
  late List<DocteurModel> docteurs;

  final AdminService service = AdminService();
  bool isChecked = false;
  @override
  void initState() {
    super.initState();
    docteurs = [];
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final List<DocteurModel> fetchedDocteurs = await service.getAllDocteurs();

      setState(() {
        docteurs = fetchedDocteurs;
      });
    } catch (e) {
      print('Erreur lors de la récupération des docteurs: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                const HeaderAdmin(),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.04,
                ),
                Expanded(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Row(children: [
                        Container(
                          height: MediaQuery.of(context).size.width * 0.04,
                          width: MediaQuery.of(context).size.width * 0.25,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 220, 217, 217),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                "Chercher un docteur",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.075,
                              ),
                              IconButton(
                                icon: const Icon(Icons.search),
                                color: primary,
                                onPressed: () {
                                  // Ajoutez ici la logique de recherche
                                  print('Clic sur l\'icône de recherche');
                                },
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.2,
                        ),
                        const Text(
                          "Liste des docteurs",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                        ),
                        const Text(
                          "Filtre",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.09,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 221, 219, 219),
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              const Text("Status"),
                              IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  // Ajoutez ici la logique de recherche
                                  print('Clic sur l\'icône de recherche');
                                },
                              )
                            ],
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.width * 0.05,
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.grey),
                          //borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 1,
                            ),
                            Text(
                              "Nom Prenom",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Adresse",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Numero",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Email",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Lieu de travail",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Contact du travail",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Status",
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              "Action",
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      FutureBuilder<List<DocteurModel>>(
                        future: service.getAllDocteurs(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const CircularProgressIndicator();
                            // } else if (snapshot.hasError) {
                            //   return Text('Erreur: ${snapshot.error}');
                          } else if (snapshot.data == null ||
                              snapshot.data!.isEmpty) {
                            // Display a message when there are no doctors available.
                            return const Text('Aucun docteur disponible.');
                          } else {
                            // Doctors are available, display the list.
                            List<DocteurModel> docteurs = snapshot.data!;

                            return Column(
                              children: docteurs.map((docteur) {
                                return Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height:
                                      MediaQuery.of(context).size.width * 0.04,
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: primary),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Text(
                                        docteur.nomPrenom ?? "",
                                      ),
                                      Text(
                                        docteur.adresse ?? "",
                                      ),
                                      Text(
                                        (docteur.numero).toString() ?? "",
                                      ),
                                      Text(
                                        docteur.email ?? "",
                                      ),
                                      Text(
                                        docteur.lieuDeTravail ?? "",
                                      ),
                                      Text(
                                        docteur.adresseDuTravail ?? "",
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          // Utilisez l'ID du docteur que vous souhaitez valider
                                          int docteurId =
                                              docteur.idDocteur ?? 0;

                                          // Appelez la méthode de validation du service
                                          var response = await service
                                              .validateDoctor(docteurId);

                                          if (response.statusCode == 200) {
                                            // La validation a réussi, mettez à jour l'état ou effectuez d'autres actions nécessaires
                                            setState(() {
                                              docteur.valide = true;
                                            });

                                            // Affichez un message ou effectuez d'autres actions en cas de succès
                                            print('Docteur validé avec succès');
                                          } else {
                                            // La validation a échoué, affichez un message d'erreur ou effectuez des actions appropriées
                                            print(
                                                'Erreur lors de la validation du docteur: ${response.statusCode}');
                                          }
                                        },
                                        child: Container(
                                          width: 30.0,
                                          height: 30.0,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: docteur.valide
                                                ? Colors.green
                                                : Colors.transparent,
                                            border: Border.all(
                                              color: primary,
                                              width: 2.0,
                                            ),
                                          ),
                                          child: docteur.valide
                                              ? Icon(
                                                  Icons.check,
                                                  color: Colors.white,
                                                  size: 20.0,
                                                )
                                              : null,
                                        ),
                                      ),
                                      Image.asset("assets/image/poubelle.png"),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
