import 'package:flutter/material.dart';

class Grossesse extends StatefulWidget {
  const Grossesse({Key? key}) : super(key: key);

  @override
  State<Grossesse> createState() => _GrossesseState();
}

class _GrossesseState extends State<Grossesse> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            // Image en arrière-plan
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/logo.jpg'), // Remplacez par le chemin de votre image
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Autres widgets au-dessus de l'image
            const Center(
              child: Text(
                'Hello, Flutter!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
