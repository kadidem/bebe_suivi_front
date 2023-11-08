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
                      final email = emailController.text;
                      final password = passwordController.text;

                      final response = await userService.loginUser(email, password);

                      if (response.statusCode == 200) {
                        // Connexion réussie
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Connexion réussie'),
                          ),
                        );
                        print('Connexion réussie');
                      } else {
                        // Identifiants invalides ou autre erreur d'authentification
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Identifiants invalides ou erreur de connexion'),
                          ),
                        );
                        print('Erreur de connexion: ${response.body}');
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
