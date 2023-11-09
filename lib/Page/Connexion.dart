import 'package:bebe_suivi/Page/Demarrage.dart';
import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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
                        cursorColor: Color(0x00f28482),
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
                        cursorColor: Color(0x00f28482),
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
                      await service.loginUser(
                          emailController.text, passwordController.text);

                      // Effacer les champs de texte
                      // _emailController.clear();
                      // _passwordController.clear();

                      // Naviguer vers la page d'accueil
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Demarrage()),
                      );
                    } catch (e) {
                      // Gérer les erreurs de connexion
                      // ignore: avoid_print
                      print('Erreur de connexion : $e');
                      if (e.toString().contains('Identifiants invalides')) {
                        // La connexion a échoué en raison d'identifiants invalides
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Identifiants invalides. Veuillez réessayer.'),
                          ),
                        );
                      } else {
                        // Gérer d'autres erreurs de connexion
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Erreur de connexion. Veuillez réessayer.'),
                          ),
                        );
                      }
                    }
                    //
                    //   try {
                    //     // Appeler la méthode loginUser du service
                    //     await service.loginUser(
                    //         emailController.text, passwordController.text);

                    //     // Effacer les champs de texte
                    //     // _emailController.clear();
                    //     // _passwordController.clear();

                    //     // Naviguer vers la page d'accueil
                    //     // ignore: use_build_context_synchronously
                    //     Navigator.push(
                    //       context,
                    //       MaterialPageRoute(builder: (context) => Demarrage()),
                    //     );
                    //   } catch (e) {
                    //     // Gérer les erreurs de connexion
                    //     // ignore: avoid_print
                    //     print('Erreur de connexion : $e');
                    //     // ignore: use_build_context_synchronously
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       const SnackBar(
                    //           content: Text(
                    //               'Erreur de connexion. Veuillez réessayer.')),
                    //     );
                    //   }
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
                          color: Colors.blue,
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
