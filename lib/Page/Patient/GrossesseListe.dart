import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
// import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class GrossesseListe extends StatefulWidget {
  const GrossesseListe({super.key});

  @override
  State<GrossesseListe> createState() => _GrossesseListeState();
}

class _GrossesseListeState extends State<GrossesseListe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(children: [
        Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Header(),
          ),
          SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                'assets/image/grossesse1.png',
              )),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: 250,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: primary),
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(0, 5),
              //     blurRadius: 3.0,
              //   ),
              // ],
            ),
            child: const Column(
              children: [
                Center(
                  child: Text(
                    "Grossesse 2",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Date de debut:02/03/2023",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "En cours",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            width: 250,
            height: 100,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 230, 226, 226),
              border: Border.all(color: primary),
              borderRadius: BorderRadius.circular(20.0),
              // boxShadow: const [
              //   BoxShadow(
              //     color: Colors.grey,
              //     offset: Offset(0, 5),
              //     blurRadius: 3.0,
              //   ),
              // ],
            ),
            child: const Column(
              children: [
                Center(
                  child: Text(
                    "Grossesse 1",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Date de debut:02/03/2023",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "Terminer",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
          CustomButton(
            text: "Ajouter",
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Grossesse()),
              );
            },
          ),
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
      ])),
    );
  }
}
