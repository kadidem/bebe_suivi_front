import 'package:flutter/material.dart';
import 'package:bebe_suivi/Modele/BebeModel.dart';
import 'package:bebe_suivi/Page/Patient/BebeAcceuil.dart';
import 'package:bebe_suivi/Page/Patient/BebeAdd.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/BebeService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:intl/intl.dart';

class Bebe extends StatefulWidget {
  final BebeService? bebeService;

  const Bebe({Key? key, this.bebeService}) : super(key: key);

  @override
  State<Bebe> createState() => _BebeState();
}

class _BebeState extends State<Bebe> {
  late BebeService bebeService;
  List<BebeModel> bebeList = [];

  @override
  void initState() {
    super.initState();
    bebeService = widget.bebeService ?? BebeService();
    _loadBebeList();
  }

  Future<void> _loadBebeList() async {
    try {
      List<BebeModel> fetchedList = await bebeService.getAllBebes() ?? [];
      setState(() {
        bebeList = fetchedList;
      });
    } catch (e) {
      // Handle errors here
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Positioned(
          top: 200,
          right: 0,
          child: Image.asset("assets/image/tetine.png"),
        ),
        Positioned(
          top: 580,
          right: 2,
          child: Image.asset("assets/image/biberon.png"),
        ),
        Positioned(
          top: 700,
          right: 20,
          child: Image.asset(
            "assets/image/pied.png",
            width: 60,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.6,
          left: 20,
          child: Image.asset(
            "assets/image/pied.png",
            width: 60,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.3,
          left: 20,
          child: Image.asset(
            "assets/image/berceau.png",
            width: 90,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.70,
          left: 40,
          child: Image.asset(
            "assets/image/berceau.png",
            width: 90,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height * 0.50,
          left: 100,
          child: Image.asset(
            "assets/image/berceau.png",
            width: 90,
          ),
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: const Header(),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: Image.asset(
                'assets/image/bebeadd.png',
              ),
            ),
            Container(
              height: 350,
              width: MediaQuery.of(context).size.width * 0.8,
              child: ListView.builder(
                // shrinkWrap: true,
                itemCount: bebeList.length,
                itemBuilder: (context, index) {
                  BebeModel bebe = bebeList[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 5,
                    ),
                    // width: 250,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: primary),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const BebeAcceuil(),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                bebe.nomPrenom ?? "",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 75,
                              ),
                              Container(
                                  height: 28,
                                  width: 30,
                                  child:
                                      Image.asset('assets/image/modifier.png')),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${DateFormat('yyyy-MM-dd').format(bebe.dateNaissance)} " ??
                                    "",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${bebe.sexe}" ?? "",
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  // Display the deletion popup
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        alignment: Alignment.center,
                                        backgroundColor: Colors.white,
                                        icon: const Icon(
                                          Icons.warning,
                                          size: 100,
                                        ),
                                        title: const Text(
                                          'confirmation de suppression',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: const Text(
                                          'Etes vous sur de vouloir supprimer ce Bebe?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              // Cancel deletion
                                              Navigator.of(context).pop();
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                    horizontal: 6,
                                                  ),
                                                  width: 100,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    border: Border.all(
                                                        color: primary),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: const Text(
                                                    'NON',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {
                                              // Add logic for deletion here
                                              // After deletion, close the popup
                                              Navigator.of(context).pop();
                                            },
                                            child: Column(
                                              children: [
                                                Container(
                                                  alignment: Alignment.center,
                                                  margin: const EdgeInsets
                                                      .symmetric(
                                                    vertical: 10,
                                                    horizontal: 6,
                                                  ),
                                                  width: 100,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    color: primary,
                                                    border: Border.all(
                                                      color:
                                                          const Color.fromARGB(
                                                              255,
                                                              255,
                                                              255,
                                                              255),
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: const Text(
                                                    'OUI',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Image.asset('assets/image/poubelle.png'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomButton(
              text: "Ajouter",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BebeAdd()),
                );
              },
            ),
          ],
        ),
        Positioned(
          top: 30, // Ajustez ces valeurs selon votre mise en page
          left: 16,
          child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              }),
        ),
      ]),
    ));
  }
}
