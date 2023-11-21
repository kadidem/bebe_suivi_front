import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
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

        const HeaderAdmin(), const Text("Liste des docteurs"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      // Ajoutez ici la logique de recherche
                      print('Clic sur l\'icône de recherche');
                    },
                  )
                ],
              ),
            ),
            const Text("Filtre"),
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
                    icon: const Icon(Icons.search),
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
        DataTable(
          
          columns: const [
            DataColumn(label: Text("Nom prenom")),
            DataColumn(label: Text("Adresse")),
            DataColumn(label: Text("Numéro")),
            DataColumn(label: Text("Email")),
            DataColumn(label: Text("Etablissement Nom")),
            DataColumn(label: Text("Etablissment Contact")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Action")),
          ],
          rows: [
            for (int i = 0; i < 8; i++)
              DataRow(cells: [
                const DataCell(Text("kadidia mah Dembele")),
                const DataCell(Text("Lafiabougou")),
                const DataCell(Text("65678798")),
                const DataCell(Text("kadi@gmail.com")),
                const DataCell(Text("Gabriel-touré")),
                const DataCell(Text("87980987")),
                DataCell(Checkbox(
                  value: true,
                  onChanged: (value) {},
                )),
                const DataCell(Icon(Icons.delete))
              ])
          ],
        )
      ]),
    );
  }
}
