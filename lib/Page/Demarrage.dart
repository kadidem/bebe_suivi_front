 import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:flutter/material.dart';

class Demarrage extends StatelessWidget {
  const Demarrage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        flexibleSpace: (Container(
          child: const Header(),
        )),
      ),
      body: SingleChildScrollView(
       child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Center(
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Image.asset('assets/image/Logo.png'),
                ),
              ),
            )
          ]
       )
            ),
      bottomNavigationBar: Footer(), // Utilisez le widget de pied de page ici
    );
  }
  }
