import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
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
      ))
    ]));
  }
}
