import 'package:bebe_suivi/Page/Patient/ForumAdd.dart';
import 'package:bebe_suivi/Page/Patient/Forumdisc.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class Forum extends StatefulWidget {
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Forum"),
        // ),
        body: Stack(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: const Header(),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Expanded(
                    child: Column(children: [
                      GestureDetector(
                        onTap: () {
                          // Utiliser Navigator.push pour naviguer vers la nouvelle page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ForumAdd()),
                          );
                        },
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            //width: MediaQuery.of(context).size.width * 0.7,
                            decoration: BoxDecoration(
                                color: primary,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                "Commencez une discussion",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 5, color: primary),
                          // bottom: BorderSide(width: 1, color: primary),
                        )),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Utiliser Navigator.push pour naviguer vers la nouvelle page
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Forumdisc()),
                          );
                        },
                        child: Column(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: const BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 5, color: primary))),
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                              color: primary,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: const Text(
                                            "K",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        const Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Les mots de ventre pendant la grossesse",
                                                  style: TextStyle(
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text("15 NOV 2023"),
                                                Align(
                                                  alignment:
                                                      Alignment.bottomRight,
                                                  child: Text("5"),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 60,
                                          child: Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Icon(
                                              Icons.message,
                                              color: primary,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
              )
            ]),
          ],
        ),
      ),
    );
  }
}
