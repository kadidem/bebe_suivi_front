import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Patient/Profil.dart';
import 'package:bebe_suivi/Page/Patient/Rappel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../UserProvider.dart';

class AcceuilPatient extends StatefulWidget {
  const AcceuilPatient({super.key});

  @override
  State<AcceuilPatient> createState() => _AcceuilPatientState();
}

class _AcceuilPatientState extends State<AcceuilPatient> {
  @override
  Widget build(BuildContext context) {
    final UserModel user =
        Provider.of<UserProvider>(context, listen: false).user!;
    String userName = user.nom_prenom;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 80,
                  child: GestureDetector(
                    onTap: () {
                      // Utiliser Navigator.push pour naviguer vers la nouvelle page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Profil()),
                      );
                    },
                    child: Image.asset('assets/image/profil.png'),
                  ),
                ),

                //const SizedBox(width: 200),

                SizedBox(
                  height: 80,
                  //width: MediaQuery.of(context).size.width,
                  child: GestureDetector(
                    onTap: () {
                      // Utiliser Navigator.push pour naviguer vers la nouvelle page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Rappel()),
                      );
                    },
                    child: Image.asset('assets/image/notif.png'),
                  ),
                )
              ],
            ),
            const Text("Grossesse avancement",
                style: TextStyle(
                    fontSize: 25,
                    // fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 101, 101),
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0, 5),
                    //     blurRadius: 3.0,
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 3.0,
                      ),
                    ],
                  ),
                  child: const Text(
                    "10",
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            Text(
              "Bonjour $userName, vous êtes à votre 4ième semaine.",
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(
                height: 200,
                width: 200,
                child: Image.asset('assets/image/acceuilbebe.png')),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 101, 101),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset('assets/image/logo.png'),
                    ),
                    const Text(
                      "Le 5e mois de grossesse est riche en\n événements pour la future maman.\nVotre silhouette évolue et une prise de poids,\ntout à fait normale, est souvent constatée.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 101, 101),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset('assets/image/logo.png'),
                    ),
                    const Text(
                      "Le 5e mois de grossesse est riche en\n événements pour la future maman.\nVotre silhouette évolue et une prise de poids,\ntout à fait normale, est souvent constatée.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    )
                  ],
                )),
            Container(
                margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                height: 90,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 233, 101, 101),
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
                      height: 60,
                      width: 50,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Image.asset('assets/image/logo.png'),
                    ),
                    const Text(
                      "Le 5e mois de grossesse est riche en\n événements pour la future maman.\nVotre silhouette évolue et une prise de poids,\ntout à fait normale, est souvent constatée.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    )
                  ],
                ))
          ]),
        ),
      ),
    );
  }
}
