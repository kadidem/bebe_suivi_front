import 'package:bebe_suivi/Page/Patient/VaccinAdd.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
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
            body: SingleChildScrollView(
      child: Stack(children: [
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
                height: 30,
                width: 370,
                decoration: BoxDecoration(
                  color: primary,
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
                  children: [
                    Text(
                      'Vaccin',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      'Date',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    ),
                    Text(
                      'status',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14),
                    )
                  ],
                ),
              )),
          SizedBox(
            height: 8,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'NOM DU VACCIN',
                style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                'La date',
                style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                'le status',
                style: TextStyle(
                    // color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              ),
              Text(
                'Age',
                style: TextStyle(
                    //  color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            width: 390,
            decoration: const BoxDecoration(
                border: Border(
              top: BorderSide(width: 5, color: primary),
              // bottom: BorderSide(width: 1, color: primary),
            )),
          ),
          const Spacer(),
          GestureDetector(
              onTap: () {
                // Utiliser Navigator.push pour naviguer vers la nouvelle page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const VaccinAdd()),
                );
              },
              child: Image.asset("assets/image/seringue.png"))
        ]),
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
      ]),
    )));
  }
}
