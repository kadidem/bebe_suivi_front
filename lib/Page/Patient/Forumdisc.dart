import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Forumdisc extends StatefulWidget {
  const Forumdisc({Key? key}) : super(key: key);

  @override
  State<Forumdisc> createState() => _ForumdiscState();
}

class _ForumdiscState extends State<Forumdisc> {
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

          const SizedBox(
            width: 90,
          ),
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: primary,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(40.0),
            ),
            alignment: Alignment.center,
            child: const Text(
              "K",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18),
            ),
          ),
          const SizedBox(
            width: 70,
          ),
          // Image.asset("assets/image/plus.png")

          // Column(
          //   children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Les mots de ventre pendant la grossesse',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  // height: 120,
                  // width: 550,
                  decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(10.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0, 5),
                    //     blurRadius: 3.0,
                    //   ),
                    // ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "K",
                          style: TextStyle(
                              //color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(children: [
                        Text(
                          'Bonjour j’ai des mots de ventre \n frequements  quelqu’un peut il m’aider \n je suis à mon troisiéme mois  \n de grossesse merci d’avance.',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ]),
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  // height: 120,
                  // width: 550,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: primary),
                    borderRadius: BorderRadius.circular(10.0),
                    // boxShadow: const [
                    //   BoxShadow(
                    //     color: Colors.grey,
                    //     offset: Offset(0, 5),
                    //     blurRadius: 3.0,
                    //   ),
                    // ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: primary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "F",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(children: [
                        Text(
                          'Bonjour j’ai des mots de ventre \n frequements  quelqu’un peut il m’aider \n je suis à mon troisiéme mois  \n de grossesse merci d’avance.',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ]),
                    ],
                  ))),
          const Spacer(),
          // Use Expanded to take up remaining vertical space
          Row(children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: primary,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Image.asset("/image/profilb.png"),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  height: 60,
                  width: 250,
                  decoration: BoxDecoration(
                    color: primary,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(40.0),
                    // boxShadow: const [
                    //   // BoxShadow(
                    //   //   color: Colors.grey,
                    //   //   offset: Offset(0, 5),
                    //   //   blurRadius: 3.0,
                    //   // ),
                    // ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      const Text(
                        'Participe a cette discussion',
                        style: TextStyle(color: Colors.white),
                      ),
                      Container(
                          height: 60,
                          width: 60,
                          child: Image.asset("/image/send.png"))
                    ],
                  ),
                )),
          ]),
        ])
      ]),
    )));
  }
}
