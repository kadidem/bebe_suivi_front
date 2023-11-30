import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  Color greyColor = Colors.grey;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: [
          Column(children: [
            // Text("Panneau de controle"),

            const HeaderAdmin(),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade700,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                padding: const EdgeInsets.only(top: 40),
                child: Row(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.width * 0.8,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: const Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Notifications",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                )),
                                Icon(Icons.delete)
                              ],
                            ),
                          ),
                          notificationscard(context),
                          notificationscard(context),
                          notificationscard(context),
                          notificationscard(context),
                          notificationscard(context),
                        ],
                      ),
                    ),
                    Expanded(
                      child:
                          Center(child: Image.asset("assets/image/rappel.png")),
                    )
                  ],
                ),
              ),
            ))
          ]),
          Positioned(
            top: 16, // Ajustez ces valeurs selon votre mise en page
            left: 16,
            child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 50,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ],
      )),
    );
  }

  notificationscard(BuildContext context) {
    greyColor = greyColor == Colors.grey ? Colors.white : Colors.grey;
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Material(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        child: Container(
          decoration: BoxDecoration(
              color: greyColor,
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("assets/image/patient.png"),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Column(
                      children: [
                        Text(
                          "Dr Fatoumata Sangaré",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Text("Demande d’inscription")
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Checkbox(
                        value: true,
                        onChanged: (value) {},
                      ),
                      const Icon(Icons.delete)
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
