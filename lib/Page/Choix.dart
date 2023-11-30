// import 'package:bebe_suivi/Page/Connexion.dart';
// import 'package:bebe_suivi/Page/Inscription.dart';
// import 'package:bebe_suivi/Page/footer.dart';
// import 'package:bebe_suivi/Page/header.dart';
// import 'package:flutter/material.dart';

// class Choix extends StatefulWidget {
//   const Choix({super.key});

//   @override
//   State<Choix> createState() => _ChoixState();
// }

// //
// class _ChoixState extends State<Choix> {
//   Color mycolors = const Color(0xFFF28482);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(children: [
//         Container(
//           width: MediaQuery.of(context).size.width,
//           child: const Header(),
//         ),
//         SizedBox(
//             height: 350,
//             width: MediaQuery.of(context).size.width,
//             child: Image.asset(
//               'assets/image/question.png',
//             )),
//         // const Text("Parce que chaque mère mérite un suivi de grossesse de première classe. ",
//         const Text(
//           "Estes vous un docteur ou un patient ",
//           textAlign: TextAlign.center,
//           style: TextStyle(
//             fontSize: 25,
//             fontWeight: FontWeight.bold,
//             fontStyle: FontStyle.italic,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   Column(
//                     children: [
//                       Image.asset(
//                         'assets/image/patient.png',
//                         width: 120,
//                         height: 120,
//                       ),
//                       Container(
//                         width: 120,
//                         height: 35,
//                         padding: const EdgeInsets.only(left: 0, top: 10),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: mycolors,
//                             onPrimary: mycolors,
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Connexion()),
//                             );
//                           },
//                           child: const Center(
//                             child: Text(
//                               'Patient',
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontStyle: FontStyle.italic,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                   const SizedBox(width: 120),
//                   Column(
//                     children: [
//                       Image.asset(
//                         'assets/image/docteur.png',
//                         width: 120,
//                         height: 120,
//                       ),
//                       Container(
//                         width: 120,
//                         height: 35,
//                         padding: const EdgeInsets.only(left: 0, top: 10),
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: mycolors,
//                             onPrimary: mycolors,
//                           ),
//                           onPressed: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const Inscription()),
//                             );
//                           },
//                           child: const Center(
//                             child: Text(
//                               'Docteur',
//                               style: TextStyle(
//                                   fontSize: 15,
//                                   fontStyle: FontStyle.italic,
//                                   color: Colors.white),
//                             ),
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         )
//       ]),
//       bottomNavigationBar: Footer(),
//     );
//   }
// }
// //
import 'package:bebe_suivi/Page/Docteur/InscriptionDoc.dart';
import 'package:flutter/material.dart';
import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';

class Choix extends StatefulWidget {
  const Choix({super.key});

  @override
  State<Choix> createState() => _ChoixState();
}

class _ChoixState extends State<Choix> {
  Color mycolors = const Color(0xFFF28482);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: const Header(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.7,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/image/question.png'),
          ),
          const Text(
            "Etes vous un docteur ou un patient ",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/image/patient.png',
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.35,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.1,
                      padding: const EdgeInsets.only(left: 0, top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mycolors,
                          onPrimary: mycolors,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Connexion(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Patient',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/image/choixdoc.png',
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.35,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.35,
                      height: MediaQuery.of(context).size.width * 0.1,
                      padding: const EdgeInsets.only(left: 0, top: 10),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: mycolors,
                          onPrimary: mycolors,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InscriptionDoc(),
                            ),
                          );
                        },
                        child: const Center(
                          child: Text(
                            'Docteur',
                            style: TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
