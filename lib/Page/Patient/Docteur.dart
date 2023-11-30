import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Page/Patient/DocteurInfo.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/DocteurService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Docteur extends StatefulWidget {
  const Docteur({Key? key}) : super(key: key);

  @override
  State<Docteur> createState() => _DocteurState();
}

class _DocteurState extends State<Docteur> {
  final docteurService _docteurService = docteurService();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Header(),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 90,
                      ),
                      Image.asset('/image/docteur-add.png'),
                      const SizedBox(
                        width: 70,
                      ),
                    ],
                  ),
                  // Affichage de la liste des docteurs
                  FutureBuilder<List<DocteurModel>>(
                    future: _docteurService.getAllDocteurs(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Erreur: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('Aucun docteur trouvé.');
                      } else {
                        List<DocteurModel> docteurs = snapshot.data!;

                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount: docteurs.length,
                          itemBuilder: (context, index) {
                            DocteurModel docteur = docteurs[index];
                            return GestureDetector(
                                onTap: () {
                                  // Naviguer vers la page DocteurInfo avec les informations du docteur
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DocteurInfo(docteur: docteur),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 15),
                                  child: Container(
                                    height: 90,
                                    width: 400,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(color: primary),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Container(
                                          height: 60,
                                          width: 60,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border:
                                                Border.all(color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(40.0),
                                          ),
                                          child: Image.asset(
                                              "assets/image/docteur.png"),
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              docteur.nomPrenom ?? "",
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              docteur.specialiter ?? "",
                                              style: const TextStyle(
                                                fontSize: 20,
                                              ),
                                            ),
                                            // SizedBox(
                                            //   height: 15,
                                            //   child: RatingBar(
                                            //     itemSize: 30,
                                            //     initialRating: docteur.,
                                            //     direction: Axis.horizontal,
                                            //     allowHalfRating: true,
                                            //     itemCount: 5,
                                            //     ratingWidget: RatingWidget(
                                            //       full: const Icon(
                                            //         Icons.star,
                                            //         size: 2,
                                            //         color: Colors.amber,
                                            //       ),
                                            //       half: const Icon(
                                            //         size: 2,
                                            //         Icons.star,
                                            //         color: Colors.white,
                                            //       ),
                                            //       empty: const Icon(
                                            //         Icons.star,
                                            //         color: Colors.grey,
                                            //       ),
                                            //     ),
                                            //     itemPadding:
                                            //         const EdgeInsets.symmetric(
                                            //             horizontal: 4.0),
                                            //     onRatingUpdate: (rating) {
                                            //       setState(() {});
                                            //     },
                                            //     updateOnDrag: true,
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                        Image.asset("assets/image/plus.png")
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        );
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
