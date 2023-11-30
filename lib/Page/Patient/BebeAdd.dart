import 'package:bebe_suivi/Modele/BebeModel.dart';
import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Page/GrossesseProvide.dart';
import 'package:bebe_suivi/Page/Patient/Bebe.dart';

import 'package:bebe_suivi/Page/Patient/Navigation.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/BebeService.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BebeAdd extends StatefulWidget {
  const BebeAdd({super.key});

  @override
  State<BebeAdd> createState() => _BebeAddState();
}

class _BebeAddState extends State<BebeAdd> {
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nonbrejourController = TextEditingController();
  TextEditingController intialdateval = TextEditingController();
  List<String?> nombrePrisesOptions = [null, 'F', 'M'];
  String? selectedNombrePrises;
  GrossesseModel? selectedGrossesse;

  final BebeService bebeService = BebeService();
  final _formKey = GlobalKey<FormState>();
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text =
            DateFormat('yyyy-MM-dd').format(picked).split(" ")[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<GrossesseModel> grossesses =
        Provider.of<GrossesseProvider>(context, listen: false)
                .listeGrossesses ??
            [];
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Header(),
                ),
                SizedBox(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/image/bebeadd.png'),
                ),
                const Text(
                  "Ajout Bebe",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Column(children: [
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
                            hintText: 'Entrer le nom et prenom du bebe',
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
                        horizontal: 30,
                        vertical: 15,
                      ),
                      child: Container(
                        height: 50,
                        width: 370,
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
                        child: Row(
                          children: [
                            const SizedBox(
                              height: 2,
                            ),
                            Expanded(
                              child: TextFormField(
                                controller: dateController,
                                validator: MultiValidator([
                                  RequiredValidator(
                                      errorText: 'Ce champ est requis'),
                                ]),
                                readOnly:
                                    true, // Pour empêcher la saisie directe dans le champ de texte
                                onTap: _selectDate,
                                cursorColor: const Color(0x00f28482),
                                decoration: const InputDecoration(
                                  hintText:
                                      'Entrez la date de naissance du bebe',
                                  //contentPadding:
                                  //  EdgeInsets.symmetric(horizontal: 15.0),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.calendar_today),
                              color: primary,
                              onPressed: _selectDate,
                            ),
                          ],
                        ),
                      ),
                    ),
                    DropdownButtonFormField<GrossesseModel>(
                      value: selectedGrossesse,
                      onChanged: (GrossesseModel? newValue) {
                        setState(() {
                          selectedGrossesse = newValue;
                        });
                      },
                      items: grossesses.map((GrossesseModel grossesse) {
                        return DropdownMenuItem<GrossesseModel>(
                          value: grossesse,
                          child: Text(grossesse.idGrossesse.toString()),
                        );
                      }).toList(),
                      decoration: const InputDecoration(
                        labelText: 'Sélectionnez une grossesse',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 15),
                      child: Container(
                        width: 370,
                        height: 60,
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
                        child: DropdownButton<String?>(
                          value: selectedNombrePrises,
                          onChanged: (newValue) {
                            setState(() {
                              selectedNombrePrises = newValue;
                            });
                          },
                          underline: Container(
                            // Utilisez un Container pour masquer la ligne
                            height: 0,
                          ),
                          items: nombrePrisesOptions.map((String? value) {
                            return DropdownMenuItem<String?>(
                              value: value,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0),
                                child: Text(value != null
                                    ? value.toString()
                                    : 'Sélectionner le sexe du bebe'),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ]),
                ),
                CustomButton(
                    text: "Ajouter",
                    onTap: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        BebeModel bebe = BebeModel(
                          nomPrenom: emailController.text,
                          dateNaissance: DateTime.parse(dateController.text),
                          sexe: selectedNombrePrises ?? '',
                          grossesse: selectedGrossesse,
                        );

                        var response = await bebeService.createBebe(bebe);
                        if (response == true) {
                          // ignore: use_build_context_synchronously
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text('Inscription réussie!'),
                                content:
                                    const Text('Vous êtes maintenant inscrit.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pop(); // Close the dialog
                                      // Navigate to the login page
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const Bebe()),
                                      );
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        } else {
                          // Registration failed, show an error message to the user
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Erreur lors de l\'inscription.'),
                              backgroundColor: Color(0xFFF28482),
                              elevation: 30,
                            ),
                          );
                        }
                      }
                    })
              ]),
              Positioned(
                top: 200,
                right: 0,
                child: Image.asset("assets/image/tetine.png"),
              ),
              Positioned(
                top: 500,
                right: 20,
                child: Image.asset("assets/image/biberon.png"),
              ),
              Positioned(
                top: 700,
                right: 20,
                child: Image.asset(
                  "assets/image/pied.png",
                  width: 60,
                ),
              ),
              // Positioned(
              //   top: MediaQuery.of(context).size.height * 0.6,
              //   left: 20,
              //   child: Image.asset(
              //     "assets/image/pied.png",
              //     width: 60,
              //   ),
              // ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.3,
                left: 20,
                child: Image.asset(
                  "assets/image/berceau.png",
                  width: 90,
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.7,
                left: 60,
                child: Image.asset(
                  "assets/image/berceau.png",
                  width: 90,
                ),
              ),
              Positioned(
                top: 16, // Ajustez ces valeurs selon votre mise en page
                left: 16,
                child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 30,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Footer(),
      ),
    );
  }
}
