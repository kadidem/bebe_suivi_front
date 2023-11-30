import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(children: [
            // Text("Panneau de controle"),

            const HeaderAdmin(),
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.04,
            ),
            Expanded(
              child: Column(children: [
                Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.4,
                    ),
                    const Text(
                      "Liste de patients",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.13,
                    ),
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
                            "Chercher un patients",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.075,
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
                    )
                  ],
                ),
                const SizedBox(
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
                        "Grossesse",
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
                Container(
                  height: MediaQuery.of(context).size.width * 0.04,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primary),
                    //borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 001,
                      ),
                      const Text(
                        "Kadidia Mah Dembele",
                        //style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "Lafiabougou",
                        //style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "78890998",
                        // style: TextStyle(color: Colors.black),
                      ),
                      const Text(
                        "Kadidem@gmail.com",
                        // style: TextStyle(color: Colors.black),
                      ),
                      const Text(
                        "1",
                        // style: TextStyle(color: Colors.white),
                      ),
                      Image.asset("assets/image/poubelle.png"),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.04,
                  width: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primary),
                    //borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 001,
                      ),
                      const Text(
                        "Kadidia Mah Dembele",
                        //style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "Lafiabougou",
                        //style: TextStyle(color: Colors.white),
                      ),
                      const Text(
                        "78890998",
                        // style: TextStyle(color: Colors.black),
                      ),
                      const Text(
                        "Kadidem@gmail.com",
                        // style: TextStyle(color: Colors.black),
                      ),
                      const Text(
                        "1",
                        // style: TextStyle(color: Colors.white),
                      ),
                      Image.asset("assets/image/poubelle.png"),
                      const SizedBox(
                        width: 6,
                      ),
                    ],
                  ),
                ),
              ]),
            )
          ]),
          Positioned(
            top: 16, // Ajustez ces valeurs selon votre mise en page
            left: 16,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ],
      )),
    );
  }
}
