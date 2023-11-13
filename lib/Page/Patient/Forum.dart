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
        appBar: AppBar(
          title: Text("Forum"),
        ),
        body: Stack(
          children: [
            Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: Header(),
              ),
              Expanded(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Expanded(
                    child: Column(children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          //width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Commencez une discussion",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                          top: BorderSide(width: 1, color: primary),
                          // bottom: BorderSide(width: 1, color: primary),
                        )),
                        child: Column(
                          children: [
                            for (var i = 0; i < 5; i++)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1, color: primary))),
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
                                          child: Text(
                                            "K",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: Colors.white),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(
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
                                        SizedBox(
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
