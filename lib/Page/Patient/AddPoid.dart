import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:bebe_suivi/Page/Patient/Rdv.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/MedicamentService.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart'; // Importez le package

class AddPoid extends StatefulWidget {
  const AddPoid({super.key});

  @override
  State<AddPoid> createState() => _AddPoidState();
}

class _AddPoidState extends State<AddPoid> {
  TextEditingController poidController = TextEditingController();
  TextEditingController tailleController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController tailleteteController = TextEditingController();
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
              child: Image.asset('assets/image/poidbebe.jpg'),
            ),
            const Text(
              "Ajouter Poid",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
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
                        controller: poidController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: const Color(0x00f28482),
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: 'Saisissez l’age du bebe en mois',
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
                        controller: tailleController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        obscureText: true,
                        cursorColor: const Color(0x00f28482),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: 'Saisissez la taille du bébé',
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
                        controller: poidController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        obscureText: true,
                        cursorColor: const Color(0x00f28482),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: 'Saisissez le poid du bébé',
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
                        controller: tailleteteController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        obscureText: true,
                        cursorColor: const Color(0x00f28482),
                        keyboardType: TextInputType.visiblePassword,
                        decoration: const InputDecoration(
                          hintText: 'Saisissez la taille de la tête du bébé',
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
              text: "Ajouter",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Rdv()),
                );

                // if (_formKey.currentState!.validate()) {
                //   try {
                //     await medicamentService.saveMedicament(
                //       NomController.text,
                //       selectedNombrePrises ?? 0,
                //       int.parse(nonbrejourController.text),
                //     );
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('Médicament ajouté avec succès!'),
                //         backgroundColor: Color(0xFFF28482),
                //         elevation: 100,
                //       ),
                //     );
                //   } catch (e) {
                //     // Une exception s'est produite lors de l'ajout, affichez un message d'erreur à l'utilisateur
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       const SnackBar(
                //         content: Text('Erreur lors de l\'ajout du médicament.'),
                //         backgroundColor: Color(0xFFF28482),
                //         elevation: 30,
                //       ),
                //     );
                //   }
                // }
              },
            )
          ],
        ),
      ),
    );
  }
}
