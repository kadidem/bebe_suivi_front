import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class AdministrationPage extends StatefulWidget {
  const AdministrationPage({super.key});

  @override
  State<AdministrationPage> createState() => _AdministrationPageState();
}

class _AdministrationPageState extends State<AdministrationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        // Text("Panneau de controle"),

        HeaderAdmin(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Text("Chercher un administrateur"),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Ajoutez ici la logique de recherche
                    print('Clic sur l\'icône de recherche');
                  },
                ),
                Image.asset("assets/images/plus.png")
              ],
            ),
          ),
        ),
        Row(
          children: [
            Text("Nom prenom"),
            Text("Nom prenom"),
            Text("Nom prenom"),
          ],
        )
      ],
    ));
  }
}
