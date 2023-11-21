import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Docteur extends StatefulWidget {
  const Docteur({Key? key}) : super(key: key);

  @override
  State<Docteur> createState() => _DocteurState();
}

class _DocteurState extends State<Docteur> {
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
        Row(
          children: [
            const SizedBox(
              width: 90,
            ),
            Image.asset('/image/docteur-add.png'),
            const SizedBox(
              width: 70,
            ),
            Image.asset("assets/image/plus.png")
          ],
        ),

        // Column(
        //   children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Container(
                height: 90,
                width: 400,
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
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Image.asset("assets/image/docteur.png"),
                    ),
                    Column(children: [
                      const Text(
                        'Docteur Mariam togo',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text("Genycologue"),
                      SizedBox(
                        height: 15,
                        // child: Visibility(
                        //   visible: widget.show,
                        child: RatingBar(
                          itemSize: 30,
                          initialRating: 3,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              size: 2,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              size: 2,
                              Icons.star,
                              color: Colors.white,
                            ),
                            empty: const Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rating) {
                            setState(() {});
                          },
                          updateOnDrag: true,
                        ),
                      ),
                    ]),
                  ],
                )))
      ]),
    ])));
  }
}
