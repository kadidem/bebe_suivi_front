import 'package:bebe_suivi/Page/Patient/AddPoid.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class PoidListe extends StatefulWidget {
  const PoidListe({super.key});

  @override
  State<PoidListe> createState() => _PoidListeState();
}

class _PoidListeState extends State<PoidListe> {
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

        Image.asset('/image/balance.png'),
        // Column(
        //   children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Container(
              height: 30,
              width: 390,
              decoration: BoxDecoration(
                color: primary,
                // border: Border.all(color: primary),
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
                    'Poid',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    'Taille',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    'Tour de tête',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  ),
                  Text(
                    'Age',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14),
                  )
                ],
              ),
            )),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Poid',
              style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              'Taille',
              style: TextStyle(
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
            Text(
              'Tour de tête',
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
                MaterialPageRoute(builder: (context) => const AddPoid()),
              );
            },
            child: Image.asset("assets/image/plus.png"))
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
    ])));
  }
}
