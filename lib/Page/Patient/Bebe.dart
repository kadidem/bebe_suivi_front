import 'package:bebe_suivi/Page/Patient/BebeAdd.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Bebe extends StatefulWidget {
  const Bebe({Key? key}) : super(key: key);

  @override
  State<Bebe> createState() => _BebeState();
}

class _BebeState extends State<Bebe> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Header(),
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 150,
                  child: Image.asset(
                    'assets/image/bebeadd.png',
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Kaidia Diarra",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 60,
                        ),
                        Image.asset('assets/image/modifier.png'),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "12/10/2023       F",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        Image.asset('assets/image/poubelle.png'),
                      ],
                    ),
                  ],
                ),
              ),
              CustomButton(
                text: "Ajouter",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BebeAdd()),
                  );
                },
              )
            ]),
            Positioned(
              top: 200,
              right: 0,
              child: Image.asset("assets/image/tetine.png"),
            ),
            Positioned(
              top: 500,
              right: 20,
              child: Image.asset("assets/image/biberon.png"),
            ),
            Positioned(
              top: 700,
              right: 20,
              child: Image.asset(
                "assets/image/pied.png",
                width: 60,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.6,
              left: 20,
              child: Image.asset(
                "assets/image/pied.png",
                width: 60,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.3,
              left: 20,
              child: Image.asset(
                "assets/image/berceau.png",
                width: 90,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.7,
              left: 60,
              child: Image.asset(
                "assets/image/berceau.png",
                width: 90,
              ),
            ),
            Positioned(
              top: 16, // Ajustez ces valeurs selon votre mise en page
              left: 16,
              child: IconButton(
                  icon: Icon(
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
    );
  }
}
