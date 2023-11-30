import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/Docteur/ConnexionDoc.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/DocteurService.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:form_field_validator/form_field_validator.dart'; // Importez le package

class InscriptionDoc2 extends StatefulWidget {
  final Map<String, String> formData;
  InscriptionDoc2({required this.formData});

  @override
  State<InscriptionDoc2> createState() => _InscriptionDoc2State();
}

class _InscriptionDoc2State extends State<InscriptionDoc2> {
  // Color mycolors = const Color(0xFFF28482);
  docteurService service = docteurService();
  final _formKey = GlobalKey<FormState>();
  TextEditingController specialiteController = TextEditingController();
  TextEditingController etabliController = TextEditingController();
  TextEditingController adresseController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print("Données de la page 1 : ${widget.formData}");
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
                          controller: specialiteController,
                          validator: MultiValidator([
                            // Utilisez MultiValidator pour plusieurs validations
                            RequiredValidator(errorText: 'Ce champ est requis'),
                          ]),
                          cursorColor: const Color(0x00f28482),
                          decoration: const InputDecoration(
                            hintText: 'Saisissez votre Specialiter',
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
                          controller: etabliController,
                          validator: MultiValidator([
                            // Utilisez MultiValidator pour plusieurs validations
                            RequiredValidator(errorText: 'Ce champ est requis'),
                          ]),
                          cursorColor: const Color(0x00f28482),
                          decoration: const InputDecoration(
                            hintText:
                                'Entrer l etablissement ou vous travailler',
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
                            hintText:
                                'Entrez le contact de votre etablissement',
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
                            hintText:
                                'Entrez votre adresse de votre lieu de travail',
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
                  onTap: () async {
                    if (_formKey.currentState?.validate() ?? false) {
                      // Récupérez les données du formulaire
                      Map<String, String> formData = {
                        "specialiter": specialiteController.text,
                        "etablissement": etabliController.text,
                        "contactDuTravail": numeroController.text,
                        "adresseDuTravail": adresseController.text,
                      };

                      // Fusionnez les données du formulaire de la première page avec celles de la deuxième page
                      formData.addAll(widget.formData);

                      // Appelez la fonction pour ajouter le docteur dans la base de données
                      var response = await service.saveDocteur(
                        formData["nomPrenom"]!,
                        formData["email"]!,
                        formData["password"]!,
                        formData["adresse"]!,
                        formData["numero"]!,
                        formData["specialiter"]!,
                        formData["etablissement"]!,
                        formData["contactDuTravail"]!,
                        formData["adresseDuTravail"]!,
                      );

                      // Vérifiez si l'inscription a réussi (statut 200 OK)
                      if (response.statusCode == 200) {
                        // L'inscription a réussi, redirigez l'utilisateur
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ConnexionDoc()),
                        );
                      } else {
                        // L'inscription a échoué, affichez un message d'erreur à l'utilisateur
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Échec de l'inscription. Veuillez vérifier vos informations."),
                            backgroundColor: Colors.red,
                          ),
                        );
                        print(
                            "Échec de l'inscription. Statut de la réponse : ${response.statusCode}");
                      }
                    }
                  },

                  //   if (_formKey.currentState?.validate() ?? false) {
                  //     // Récupérez les données du formulaire
                  //     Map<String, String> formData = {
                  //       "specialiter": specialiteController.text,
                  //       "etablissement": etabliController.text,
                  //       "contactDuTravail": numeroController.text,
                  //       "adresseDuTravail": adresseController.text,
                  //     };
                  //     print(formData);
                  //     // Fusionnez les données du formulaire de la première page avec celles de la deuxième page
                  //     formData.addAll(widget.formData);

                  //     // Appelez la fonction pour ajouter le docteur dans la base de données
                  //     // service.saveDocteur(
                  //     //   formData["nomPrenom"]!,
                  //     //   formData["email"]!,
                  //     //   formData["motDePasse"]!,
                  //     //   formData["adresse"]!,
                  //     //   formData["numero"]!,
                  //     //   formData["specialiter"]!,
                  //     //   formData["etablissement"]!,
                  //     //   formData["contactDuTravail"]!,
                  //     //   formData["adresseDuTravail"]!,
                  //     // );
                  //     service.saveDocteur(
                  //       formData["nom"] ?? "",
                  //       formData["email"] ?? "",
                  //       formData["password"] ?? "",
                  //       formData["adresse"] ?? "",
                  //       formData["numero"] ?? "",
                  //       formData["specialite"] ?? "",
                  //       formData["etablissement"] ?? "",
                  //       formData["contactDuTravail"] ?? "",
                  //       formData["adresseDuTravail"] ?? "",
                  //     );

                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => ConnexionDoc()),
                  //     );
                  //   }
                  // },
                  text: "s'inscrire"),
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
