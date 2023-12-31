import 'package:bebe_suivi/Page/Patient/VaccinAdd.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class BebeAcceuil extends StatefulWidget {
  const BebeAcceuil({super.key});

  @override
  State<BebeAcceuil> createState() => _BebeAcceuilState();
}

class _BebeAcceuilState extends State<BebeAcceuil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Header(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bebe Mady a 1 mois aujourd'hui ",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 80,
            ),
            SizedBox(
                height: 50,
                width: 50,
                child: GestureDetector(
                  onTap: () {
                    // Utiliser Navigator.push pour naviguer vers la nouvelle page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VaccinAdd()),
                    );
                  },
                  child: Image.asset("assets/image/carnet.png"),
                ))
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Poids actuel : 6kilo200g"),
            SizedBox(
              width: 190,
            ),
            Text(
              "Carnet",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            )
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Container(
              //height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.grey),
                // borderRadius: BorderRadius.circular(40.0),
                // boxShadow: const [
                //   BoxShadow(
                //     color: Colors.grey,
                //     offset: Offset(0, 5),
                //     blurRadius: 3.0,
                //   ),
                //],
              ),
              child: Column(
                children: [
                  const Text(
                    "Conseils",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    //height: 45,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(40.0),
                      boxShadow: const [
                        // BoxShadow(
                        //   color: Colors.grey,
                        //   offset: Offset(0, 5),
                        //   blurRadius: 3.0,
                        // ),
                      ],
                    ),
                    child: const Text(
                      "De 0 à 3 ans, votre bébé va connaître un épanouissement étonnant! Tout son univers va changer! Il va passer par différentes étapes d’apprentissage, essentielles à son développement alimentaire, émotionnel, moteur….C’est pourquoi, chez Bébé M (anciennement Bébé Mandorle), nous avons choisi de vous apporter plus qu’une gamme de produits, et de vous accompagner dans votre quotidien avec divers conseils issus de connaissances complémentaires, diététiques et naturopathiques.",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //height: 80,
                        width: 180,
                        child: Image.asset("/image/bebebibe.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        // height: 80,
                        width: 180,
                        child: Image.asset("assets/image/bebe6mois.png"),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        // height: 80,
                        width: 180,
                        child: Image.asset("assets/image/bebe12mois.png"),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        // height: 80,
                        width: 180,
                        child: Image.asset("assets/image/bebe3ans.png"),
                      )
                    ],
                  )
                ],
              ),
            ))
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
      const Positioned(
          top: 610, // Ajustez ces valeurs selon votre mise en page
          left: 60,
          child: Text(
            "Preparation \n de biberon",
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    ]));
  }
}
