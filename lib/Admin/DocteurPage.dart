import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class DocteurPage extends StatefulWidget {
  const DocteurPage({super.key});

  @override
  State<DocteurPage> createState() => _DocteurPageState();
}

class _DocteurPageState extends State<DocteurPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        // Text("Panneau de controle"),

        HeaderAdmin(),
        Expanded(
            child: Row(
          children: [
            Text("Liste des docteurs"),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Text("Chercher un Docteur"),
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Ajoutez ici la logique de recherche
                      print('Clic sur l\'icône de recherche');
                    },
                  )
                ],
              ),
            ),
            Text("Filtre"),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Text("Status"),
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
        ))
      ]),
    );
  }
}
