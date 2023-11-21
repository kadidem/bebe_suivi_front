import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class PatientPage extends StatefulWidget {
  const PatientPage({super.key});

  @override
  State<PatientPage> createState() => _PatientPageState();
}

class _PatientPageState extends State<PatientPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      // Text("Panneau de controle"),

      HeaderAdmin(),
      Expanded(
        child: Column(children: [
          Row(
            children: [
              Text("Liste de patients"),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Text("Chercher un patients"),
                    IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Ajoutez ici la logique de recherche
                        print('Clic sur l\'icône de recherche');
                      },
                    )
                  ],
                ),
              )
            ],
          )
        ]),
      )
    ]));
  }
}
