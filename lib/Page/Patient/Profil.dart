import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Profil extends StatefulWidget {
  const Profil({super.key});

  @override
  State<Profil> createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Header(),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Expanded(
                    child: Column(children: [
                      const SizedBox(
                        height: 30,
                      ),
                      Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primary)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/image/infosperson.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    const Text(
                                      "Modifier info personnelle",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/image/notification.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      "Notifications",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      width: 60,
                                    ),
                                    Text(
                                      "ON",
                                      style: TextStyle(
                                          color: primary,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ]),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primary)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/image/aide.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    const Text(
                                      "Aide",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Image.asset(
                                      "assets/image/contacter.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    const SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      "Nous Contactez",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/image/politique.png",
                                      width: 30,
                                      height: 30,
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    const Text(
                                      "Polique",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ]),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: "Déconnexion",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Connexion()),
                          );
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/logo.png",
                            width: 120,
                          ),
                        ],
                      ),
                    ]),
                  ),
                ),
              )
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
          ],
        ),
      ),
    );
  }
}
