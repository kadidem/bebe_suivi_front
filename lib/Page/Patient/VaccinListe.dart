import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class VaccinListe extends StatefulWidget {
  const VaccinListe({super.key});

  @override
  State<VaccinListe> createState() => _VaccinListeState();
}

class _VaccinListeState extends State<VaccinListe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Header(),
        ),

        Image.asset('/image/polio.png'),
        // Column(
        //   children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Container(
              height: 60,
              width: 370,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(40.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0, 5),
                    blurRadius: 3.0,
                  ),
                ],
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Text('Vaccin'), Text('Date'), Text('status')],
              ),
            )),
      ]),
      // Positioned(
      //   top: 16, // Ajustez ces valeurs selon votre mise en page
      //   left: 16,
      //   child: IconButton(
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // ),
    ])));
  }
}
