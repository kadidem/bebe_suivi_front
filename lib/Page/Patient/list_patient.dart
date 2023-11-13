// import 'package:bebe_suivi/Page/header.dart';
// import 'package:bebe_suivi/widgets/custom_button.dart';
// import 'package:flutter/material.dart';

// class ListGrossesse extends StatelessWidget {
//   const ListGrossesse({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
      
//       child: Scaffold(
//         appBar: AppBar(context),
//         body: Stack(
//           children: [
//             Column(children: [
//               Container(
//                 width: MediaQuery.of(context).size.width,
//                 child: Header(),
//               ),
//               Expanded(
//                 child: SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.7,
//                   child: Expanded(
//                     child: Column(children: [
//                       const Text("Ajouter ListGrossesse"),
//                       SizedBox(height: 10),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             "assets/image/foetus.png",
//                             width: 90,
//                           ),
//                         ],
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       Material(
//                         elevation: 20,
//                         borderRadius: BorderRadius.circular(20),
//                         child: TextField(
//                           decoration: InputDecoration(
//                               hintText:
//                                   "Saisissz la date du 1er jour des dernières règles",
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.grey))),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Material(
//                         elevation: 20,
//                         borderRadius: BorderRadius.circular(20),
//                         child: TextField(
//                           decoration: InputDecoration(
//                               hintText: "Saissez votre poid actuel",
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.grey))),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Material(
//                         elevation: 20,
//                         borderRadius: BorderRadius.circular(20),
//                         child: TextField(
//                           decoration: InputDecoration(
//                               hintText: "Saisissez votre âge",
//                               enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(20),
//                                   borderSide: BorderSide(color: Colors.grey))),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       CustomButton(
//                         text: "Ajouter",
//                         onTap: () {},
//                       )
//                     ]),
//                   ),
//                 ),
//               )
//             ]),
//             Positioned(
//               top: 200,
//               right: 0,
//               child: Image.asset("assets/image/biberon.png"),
//             ),
//             Positioned(
//               top: 150,
//               right: 20,
//               child: Image.asset(
//                 "assets/image/pied.png",
//                 width: 60,
//               ),
//             ),
//             Positioned(
//               top: MediaQuery.of(context).size.height * 0.4,
//               left: 20,
//               child: Image.asset(
//                 "assets/image/test.png",
//                 width: 90,
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
