import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class RendezvousDetail extends StatefulWidget {
  const RendezvousDetail({super.key});

  @override
  State<RendezvousDetail> createState() => _RendezvousDetailState();
}

class _RendezvousDetailState extends State<RendezvousDetail> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Header(),
              ),
            ]),
            Image.asset("assets/image/Rdv2.png"),
            const Text(
              "Rendez vous detail",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            const Text("Date ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text("2023/11/30 "),
            const Text("Nom du docteur",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text("Docteur Mariame Diamountene "),
            const Text("Genycologue "),
            const Text("Motif ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            const Text("Maux de ventre "),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(onTap: () {}, text: "Modifier"),
                const SizedBox(
                  width: 40,
                ),
                CustomButton(onTap: () {}, text: 'Annuler')
              ],
            ),
            Positioned(
              top: 16, // Ajustez ces valeurs selon votre mise en page
              left: 16,
              child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
