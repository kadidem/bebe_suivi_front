import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class Rdv extends StatelessWidget {
  const Rdv({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: const Header(),
        ),
      ]),
      bottomNavigationBar: Footer(),
    );
  }
}
