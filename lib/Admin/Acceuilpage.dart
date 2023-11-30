import 'package:bebe_suivi/Admin/AdministrationPage.dart';
import 'package:bebe_suivi/Admin/DocteurPage.dart';
import 'package:bebe_suivi/Admin/HeaderAdmin.dart';
import 'package:bebe_suivi/Admin/NotificationPage.dart';
import 'package:bebe_suivi/Admin/PatientPage.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class Acceuilpage extends StatefulWidget {
  const Acceuilpage({super.key});

  @override
  State<Acceuilpage> createState() => _AcceuilpageState();
}

class _AcceuilpageState extends State<Acceuilpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      HeaderAdmin(),
      Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Panneau de controle",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("/image/images/ordi.png"),
                SizedBox(
                  width: 200,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.1,
                          //height: 00,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 5),
                                blurRadius: 3.0,
                              ),
                            ],
                          ),

                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const DocteurPage()));
                            },
                            child: Column(
                              children: [
                                Image.asset("/image/images/docteur.png"),
                                Text("Docteurs")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.1,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 5),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const PatientPage()));
                              },
                              child: Column(
                                children: [
                                  Image.asset("/image/images/patient.png"),
                                  Text("Patients")
                                ],
                              ),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.15,
                          height: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            // border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 5),
                                blurRadius: 3.0,
                              ),
                            ],
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const NotificationPage()));
                            },
                            child: Column(
                              children: [
                                Image.asset("image/images/notif.png"),
                                Text("Notifications")
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.15,
                            height: MediaQuery.of(context).size.width * 0.1,

                            // height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              // border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(20.0),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0, 5),
                                  blurRadius: 3.0,
                                ),
                              ],
                            ),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const AdministrationPage()));
                              },
                              child: Column(
                                children: [
                                  Image.asset("/image/images/admin.png"),
                                  Text("Administrations")
                                ],
                              ),
                            ))
                      ],
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    ]));
  }
}
