import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class Inscription extends StatelessWidget {
  const Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 200,
        flexibleSpace: (Container(
          child: const Header(),
        )),
      ),
      body: const Center(
        child: Column(
          children: [],
        ),
      ),
      bottomNavigationBar: Footer(), // Utilisez le widget de pied de page ici
    );
  }
}
