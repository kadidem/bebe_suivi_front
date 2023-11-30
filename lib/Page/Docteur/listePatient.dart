import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class ListePatient extends StatefulWidget {
  const ListePatient({super.key});

  @override
  State<ListePatient> createState() => _ListePatientState();
}

class _ListePatientState extends State<ListePatient> {
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
          Image.asset("assets/image/docteur-add.png"),
          const Text(
            "Liste des patients",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            width: 90,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Container(
                  height: 80,
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
                          "K",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Kadidia Tangara',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '76879809',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ]),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ))),
        ])
      ]),
    )));
  }
}
