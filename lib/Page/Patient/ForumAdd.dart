import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class ForumAdd extends StatefulWidget {
  const ForumAdd({super.key});

  @override
  State<ForumAdd> createState() => _ForumAddState();
}

class _ForumAddState extends State<ForumAdd> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      Column(children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const Header(),
        ),
        const Text(
          "Nausé pendant la grossesse",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        // Use Expanded to take up remaining vertical space
        Row(
          children: [
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
                      Text(
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
          ],
        ),
      ]),
      // Positioned(
      //   top: 16, // Ajustez ces valeurs selon votre mise en page
      //   left: 16,
      //   child: IconButton(
      //       icon: const Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       }),
      // ),
    ])));
  }
}
