import 'dart:convert';

import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Demarrage.dart';
import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/Patient/AcceuilPatient.dart';
import 'package:bebe_suivi/Page/Patient/Navigation.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'header.dart';
import 'footer.dart';
import 'package:form_field_validator/form_field_validator.dart'; // Importez le package

class Connexion extends StatefulWidget {
  const Connexion({super.key});

  @override
  State<Connexion> createState() => _ConnexionState();
}

class _ConnexionState extends State<Connexion> {
  Color mycolors = const Color(0xFFF28482);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  userService service = userService();
  final _formKey = GlobalKey<FormState>();
  // final userProvider = Provider.of<UserProvider>(context);
  // final user = userProvider.user;
  // String userName = userProvider.user?.nom_prenom ?? "utilisateur";
  bool isConnectionSuccessful = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Header(),
            ),
            SizedBox(
              height: 100,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/image/logo.png'),
            ),
            const Text(
              "Connexion",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.normal,
                fontStyle: FontStyle.italic,
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: emailController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: const Color(0x00f28482),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Entrer votre  email',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: TextFormField(
                        controller: passwordController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        obscureText: true,
                        cursorColor: const Color(0x00f28482),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: 'Entrez votre mots de passe',
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 15.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                //width: MediaQuery.of(context).size.width,
                height: 30,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: mycolors,
                  ),
                  onPressed: () async {
                    try {
                      // Appeler la méthode loginUser du service
                      final UserModel? user = await service.loginUser(
                          emailController.text, passwordController.text);
                      print(user);

                      if (user != null) {
                        Provider.of<UserProvider>(context, listen: false)
                            .setUser(user);
                        // Naviguer vers la page d'accueil
                        // ignore: use_build_context_synchronously
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('Connexion réussie'),
                              content: Text('Bienvenue, ${user.nom_prenom}!'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Navigation(),
                                      ),
                                    );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Navigation()),
                                    );
                                  },
                                  child: Text('OK'),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        // Gérer le cas où loginUser renvoie null
                        print('Erreur de connexion : utilisateur null');
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Erreur de connexion. Veuillez réessayer.'),
                          ),
                        );
                      }
                    } catch (e) {
                      // Gérer les erreurs de connexion
                      print('Erreur de connexion : $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text(
                                'Erreur de connexion. Veuillez réessayer.')),
                      );
                    }
                  },
                  child: const Text(
                    'Se connecter',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: RichText(
                  text: TextSpan(
                    // style: DefaultTextStyle.of(context).style,
                    children: [
                      const TextSpan(
                        text: 'Vous n avez pas de  compte ? ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                        ),
                      ),
                      TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Inscription()));
                          },
                        text: 'Inscrivez vous',
                        style: const TextStyle(
                          color: primary,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
