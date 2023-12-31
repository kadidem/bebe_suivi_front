import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseListe.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
// import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class GrossesseAcceuil1 extends StatefulWidget {
  const GrossesseAcceuil1({super.key});

  @override
  State<GrossesseAcceuil1> createState() => _GrossesseAcceuil1State();
}

class _GrossesseAcceuil1State extends State<GrossesseAcceuil1> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Header(),
                ),
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
                CustomButton(
                  text: "Voir la liste",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GrossesseListe()),
                    );
                  },
                ),

                // const Text("Parce que chaque mère mérite un suivi de grossesse de première classe. ",
                const Text(
                  """
              Vous navez pas encore de grossesse ? cliquez ici pour aouter une grossessse""",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 90,
                    child: Image.asset(
                      'assets/image/main.png',
                    )),
                CustomButton(
                  text: "Ajouter",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => GrossesseListe()),
                    );
                  },
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
                // Container(
                //   width: MediaQuery.of(context).size.width,
                //   child: const Foo(),
                // ),
              ],
            ),
          ],
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
