import 'package:flutter/material.dart';

// class Header extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//      debugShowCheckedModeBanner: false,
//       home: Scaffold(
//           appBar: AppBar(
//             toolbarHeight: 0.0,
//           ),
//           body: Center(
//             child: Column(children: [
//               Image.asset(
//                 'assets/image/header.png',
//                 fit: BoxFit.cover,
//               ),
//             ]),
//           )),
//     );
//   }
// }

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Image.asset(
              'assets/image/header.png',
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
