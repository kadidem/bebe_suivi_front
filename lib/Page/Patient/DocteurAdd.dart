import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:form_field_validator/form_field_validator.dart'; // Importez le package

class DocteurAdd extends StatefulWidget {
  const DocteurAdd({super.key});

  @override
  State<DocteurAdd> createState() => _DocteurAddState();
}

class _DocteurAddState extends State<DocteurAdd> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController nomPrenomController = TextEditingController();
  TextEditingController specialiteController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController etablissementController = TextEditingController();
  TextEditingController numeroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Header(),
          ),
          SizedBox(
            height: 120,
            width: MediaQuery.of(context).size.width,
            child: Image.asset('assets/image/docteur-add.png'),
          ),
          const Text(
            "Ajouter son medecin",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              // fontStyle: FontStyle.italic,
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                      cursorColor: Color(0x00f28482),
                      decoration: const InputDecoration(
                        hintText: 'Saisissez le de votre medecin',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                      cursorColor: Color(0x00f28482),
                      decoration: const InputDecoration(
                        hintText: 'Entrer sa specialiter ',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                      cursorColor: Color(0x00f28482),
                      decoration: const InputDecoration(
                        hintText: 'Entrez votre numero',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
                      controller: etablissementController,
                      validator: MultiValidator([
                        // Utilisez MultiValidator pour plusieurs validations
                        RequiredValidator(errorText: 'Ce champ est requis'),
                      ]),
                      cursorColor: Color(0x00f28482),
                      decoration: const InputDecoration(
                        hintText: 'Entrez son lieu de travail',
                        contentPadding: EdgeInsets.symmetric(horizontal: 15.0),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Donner une note",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      child: Container(
                        height: 45,
                        width: 230,
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
                        child: RatingBar(
                          itemSize: 30,
                          initialRating: 3,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              size: 2,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              size: 2,
                              Icons.star,
                              color: Colors.white,
                            ),
                            empty: const Icon(
                              Icons.star,
                              color: Colors.grey,
                            ),
                          ),
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          onRatingUpdate: (rating) {
                            setState(() {});
                          },
                          updateOnDrag: true,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          CustomButton(onTap: () {}, text: "Ajouter"),
        ]),

        // const Center(child: Text("vous n'averz pas de compte"))
      ),
      bottomNavigationBar: Footer(),
    );
  }
}
