import 'package:flutter/material.dart';
import 'header.dart';
import 'footer.dart';

class Inscription extends StatelessWidget {
  const Inscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.amber,
            child: const Header(),
          ),
          SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/image/logo.png',
              )),
          const Text(
            "Inscription",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.normal,
              fontStyle: FontStyle.italic,
            ),
          ),
          SingleChildScrollView(
          child: Column(
            children: [
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey), // Couleur et style de la bordure
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Couleur de l'ombre
                            offset: Offset(0,5), // Décalage de l'ombre (horizontal, vertical)
                            blurRadius: 3.0, // Rayon de flou de l'ombre
                          ),
                        ],
                      ),
                      child: const TextField(
                        cursorColor: Color(0x00f28482),
                        decoration: InputDecoration(
                          hintText: 'Saisissez votre nom et prenom',
                          contentPadding: EdgeInsets.symmetric( horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible
                          ),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible au focus
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey), // Couleur et style de la bordure
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Couleur de l'ombre
                            offset: Offset(0,5), // Décalage de l'ombre (horizontal, vertical)
                            blurRadius: 3.0, // Rayon de flou de l'ombre
                          ),
                        ],
                      ),
                      child: const TextField(
                        cursorColor: Color(0x00f28482),
                        decoration: InputDecoration(
                          hintText: 'Entrer votre  email',
                          contentPadding: EdgeInsets.symmetric( horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible
                          ),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible au focus
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey), // Couleur et style de la bordure
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Couleur de l'ombre
                            offset: Offset(0,5), // Décalage de l'ombre (horizontal, vertical)
                            blurRadius: 3.0, // Rayon de flou de l'ombre
                          ),
                        ],
                      ),
                      child: const TextField(
                        cursorColor: Color(0x00f28482),
                        decoration: InputDecoration(
                          hintText: 'Entrez votre numero',
                          contentPadding: EdgeInsets.symmetric( horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible
                          ),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible au focus
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey), // Couleur et style de la bordure
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Couleur de l'ombre
                            offset: Offset(0,5), // Décalage de l'ombre (horizontal, vertical)
                            blurRadius: 3.0, // Rayon de flou de l'ombre
                          ),
                        ],
                      ),
                      child: const TextField(
                        cursorColor: Color(0x00f28482),
                        decoration: InputDecoration(
                          hintText: 'Entrez votre adresse',
                          contentPadding: EdgeInsets.symmetric( horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible
                          ),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible au focus
                        ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical:8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey), // Couleur et style de la bordure
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey, // Couleur de l'ombre
                            offset: Offset(0,5), // Décalage de l'ombre (horizontal, vertical)
                            blurRadius: 3.0, // Rayon de flou de l'ombre
                          ),
                        ],
                      ),
                      child: const TextField(
                        obscureText: true, 
                        cursorColor: Color(0x00f28482),
                        decoration: InputDecoration(
                          hintText: 'Entrez votre mots de passe',
                          contentPadding: EdgeInsets.symmetric( horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible
                          ),
                          focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.transparent), // Trait invisible au focus
                        ),
                        ),
                      ),
                    ),
                  ),
        ]
        )
        )
        ],
      ),
      bottomNavigationBar: Footer(),
       // Utilisez le widget de pied de page ici
    );
  }
}
