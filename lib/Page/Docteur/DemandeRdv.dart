import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class DemandeRdv extends StatefulWidget {
  const DemandeRdv({super.key});

  @override
  State<DemandeRdv> createState() => _DemandeRdvState();
}

class _DemandeRdvState extends State<DemandeRdv> {
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
          Image.asset("assets/image/notif.png"),
          const Text(
            "Notifications",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            width: 90,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                // height: 80,
                // width: 550,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "AD",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Aichata Diallo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Demande de rendez-vous pour \n le 05/11/2023 à 9h00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //const SizedBox(width: 80),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    ' Accepter',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    'Proposer',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ])
                    ]),
                // SizedBox(
                //   height: 20,
                // )
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                // height: 80,
                // width: 550,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "AD",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Aichata Diallo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Demande de rendez-vous pour \n le 05/11/2023 à 9h00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //const SizedBox(width: 80),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    ' Accepter',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    'Proposer',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ])
                    ]),
                // SizedBox(
                //   height: 20,
                // )
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                // height: 80,
                // width: 550,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "AD",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Aichata Diallo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Demande de rendez-vous pour \n le 05/11/2023 à 9h00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //const SizedBox(width: 80),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    ' Accepter',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    'Proposer',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ])
                    ]),
                // SizedBox(
                //   height: 20,
                // )
              )),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                // height: 80,
                // width: 550,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primary),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0, 5),
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "AD",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Aichata Diallo',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              'Demande de rendez-vous pour \n le 05/11/2023 à 9h00',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //const SizedBox(width: 80),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    ' Accepter',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                const SizedBox(width: 30),
                                Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 2),
                                  height: 40,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: primary,
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: const Text(
                                    'Proposer',
                                    // Vous devez obtenir cette information du modèle MedicamentModel
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ])
                    ]),
                // SizedBox(
                //   height: 20,
                // )
              )),
        ])
      ]),
    )));
  }
}
