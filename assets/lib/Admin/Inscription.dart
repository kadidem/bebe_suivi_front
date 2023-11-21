import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Inscription extends StatefulWidget {
  const Inscription({super.key});

  @override
  State<Inscription> createState() => _InscriptionState();
}

class _InscriptionState extends State<Inscription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(children: [
          Expanded(
            child: Center(child: Image.asset("assets/image/rappel.png")),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            height: 300,
            child: Column(
              children: [
                Material(
                  elevation: 12,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Entrer votre nom et prénom",
                              prefixIcon: Icon(
                                Icons.person,
                                size: 20,
                              ),
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 12,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Entrer votre email",
                              prefixIcon: Icon(
                                Icons.email,
                                size: 20,
                              ),
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Material(
                  elevation: 12,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width * .3,
                        height: 60,
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Entrer votre mot de passe",
                              prefixIcon: Icon(
                                Icons.password,
                                size: 20,
                              ),
                              contentPadding: EdgeInsets.only(left: 5),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        )),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 120,
                    child: CustomButton(onTap: () {}, text: "Ajouter"))
              ],
            ),
          )
        ]),
      ),
    );
  }
}
