import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/Docteur/ConnexionDoc.dart';
import 'package:bebe_suivi/Page/Docteur/InscriptionDoc2.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart'; // Importez le package

class InscriptionDoc extends StatefulWidget {
  InscriptionDoc({super.key});

  @override
  State<InscriptionDoc> createState() => _InscriptionDocState();
}

class _InscriptionDocState extends State<InscriptionDoc> {
  // Color mycolors = const Color(0xFFF28482);
  userService service = userService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomPrenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController numeroController = TextEditingController();
  Map<String, String> formData = {};
//Map<String, String> formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Header(),
              ),
              SizedBox(
                height: 80,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/image/logo.png'),
              ),
              const Text(
                "Inscription",
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
                          horizontal: 20, vertical: 6),
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
                          controller: nomPrenomController,
                          validator: MultiValidator([
                            // Utilisez MultiValidator pour plusieurs validations
                            RequiredValidator(errorText: 'Ce champ est requis'),
                          ]),
                          cursorColor: const Color(0x00f28482),
                          decoration: const InputDecoration(
                            hintText: 'Saisissez votre nom et prénom',
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
                          horizontal: 20, vertical: 6),
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
                          horizontal: 20, vertical: 6),
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
                          controller: numeroController,
                          validator: MultiValidator([
                            // Utilisez MultiValidator pour plusieurs validations
                            RequiredValidator(errorText: 'Ce champ est requis'),
                          ]),
                          cursorColor: const Color(0x00f28482),
                          decoration: const InputDecoration(
                            hintText: 'Entrez votre numero',
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
                          horizontal: 20, vertical: 6),
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
                          controller: adresseController,
                          validator: MultiValidator([
                            // Utilisez MultiValidator pour plusieurs validations
                            RequiredValidator(errorText: 'Ce champ est requis'),
                          ]),
                          cursorColor: const Color(0x00f28482),
                          decoration: const InputDecoration(
                            hintText: 'Entrez votre adresse',
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
                          horizontal: 20, vertical: 6),
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
              CustomButton(
                  onTap: () {
                    formData = {
                      "nomPrenom": nomPrenomController.text,
                      "email": emailController.text,
                      "adresse": adresseController.text,
                      "numero": numeroController.text,
                      "password": passwordController.text,
                    };
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              InscriptionDoc2(formData: formData)),
                    );
                  },
                  text: "Suivant"),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: RichText(
                    text: TextSpan(
                      // style: DefaultTextStyle.of(context).style,
                      children: [
                        const TextSpan(
                          text: 'Vous avez déjà un compte ? ',
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
                                      builder: (context) => ConnexionDoc()));
                            },
                          text: 'Se connecter',
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
          // const Center(child: Text("vous n'averz pas de compte"))
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
