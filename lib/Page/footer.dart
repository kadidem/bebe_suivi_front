import 'package:flutter/material.dart';

// class Footer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           toolbarHeight: 0.0,
//         ),
//         body: Stack(
//           children: [
//             // Le contenu de votre page ici

//             Align(
//               alignment: Alignment.bottomRight,
//               child: Image.asset(
//                 'assets/image/footer.png',
//                  fit: BoxFit.cover,
//               ),
//             ),
//           ],
  //       ),
  //     ),
  //   );
  // }
  class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            'assets/image/footer.png',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
