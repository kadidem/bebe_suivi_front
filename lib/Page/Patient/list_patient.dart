import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ListGrossesse extends StatelessWidget {
  const ListGrossesse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Liste de grossesse"),
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
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/image/grossesse1.png",
                            width: 120,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primary)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(children: [
                                Text(
                                  "Grossesse 2",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Date de debut:02/03/2023"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("En cours")
                              ]),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Material(
                          elevation: 20,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: primary)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, top: 10, bottom: 10),
                              child: Column(children: [
                                Text(
                                  "Grossesse 2",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Date de debut:02/03/2023"),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("En cours")
                              ]),
                            ),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        text: "Ajouter",
                        onTap: () {},
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
