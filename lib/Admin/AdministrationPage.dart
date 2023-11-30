import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Admin/Inscription.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class AdministrationPage extends StatefulWidget {
  const AdministrationPage({super.key});

  @override
  State<AdministrationPage> createState() => _AdministrationPageState();
}

class _AdministrationPageState extends State<AdministrationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(
            children: [
              // Text("Panneau de controle"),

              const HeaderAdmin(),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                    // height: 10,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Chercher un administratreur",
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  const Text(
                    "Liste des administrateurs",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                  ),
                  GestureDetector(
                      onTap: () {
                        // Utiliser Navigator.push pour naviguer vers la nouvelle page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InscriptionAdmin()),
                        );
                      },
                      child: Image.asset("assets/image/plus.png"))
                ],
              ),
              // const SizedBox(
              //   height: 30,
              // ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //   //height: MediaQuery.of(context).size.width * 0.04,
                  //   width: MediaQuery.of(context).size.width * 0.9,
                  // ),
                  Text("Nom prenom"),
                  Text("Email"),
                  Text("Mots de passe"),
                  Text("Actions"),
                ],
              ),
              Container(
                height: 6,
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(color: Colors.transparent),
                  // borderRadius: BorderRadius.circular(20),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.width * 0.04,
                width: MediaQuery.of(context).size.width * 0.8,
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
                    Image.asset("assets/image/poubelle.png"),
                    Image.asset("assets/image/modifier.png"),
                    const SizedBox(
                      width: 6,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
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
