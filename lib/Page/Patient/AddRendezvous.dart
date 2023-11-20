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

class AddRendezvous extends StatefulWidget {
  // const AddRendezvous({super.key});
  final DateTime selectedDate;
  const AddRendezvous({Key? key, required this.selectedDate}) : super(key: key);

  @override
  State<AddRendezvous> createState() => _AddRendezvousState();
}

class _AddRendezvousState extends State<AddRendezvous> {
  TextEditingController NomController = TextEditingController();
  TextEditingController nonbrefoisController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nonbrejourController = TextEditingController();
  TextEditingController intialdateval = TextEditingController();
  List<int?> nombrePrisesOptions = [null, 1, 2, 3, 4, 5];
  int? selectedNombrePrises;
  final MedicamentService medicamentService = MedicamentService();
  // Future<void> _selectDate() async {
  //   DateTime? picked = await showDatePicker(
  //     context: context,
  //     initialDate: DateTime.now(),
  //     firstDate: DateTime(2000),
  //     lastDate: DateTime(2060),
  //   );
  //   if (picked != null && picked != DateTime.now()) {
  //     setState(() {
  //       dateController.text = DateFormat('yyyy-MM-dd').format(picked);
  //     });
  //   }
  // }

  final _formKey = GlobalKey<FormState>();
  bool isConnectionSuccessful = false;

  @override
  Widget build(BuildContext context) {
    dateController.text = DateFormat('yyyy-MM-dd').format(widget.selectedDate);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Header(),
            ),
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/image/Rdv2.png'),
            ),
            const Text(
              "Ajouter un Rendez-vous",
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 5),
                              blurRadius: 3.0,
                            ),
                          ],
                        ),
                        child: Row(children: [
                          Expanded(
                            child: TextFormField(
                              controller: dateController,
                              validator: MultiValidator([
                                RequiredValidator(
                                    errorText: 'Ce champ est requis'),
                              ]),
                              readOnly:
                                  true, // Pour empêcher la saisie directe dans le champ de texte
                              //onTap: _selectDate,
                              cursorColor: Color(0x00f28482),
                              decoration: const InputDecoration(
                                hintText: 'Entrez la date de rendez vous',
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 15.0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primary),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: primary),
                                ),
                              ),
                            ),
                          ),
                          // IconButton(
                          //   icon: Icon(Icons.calendar_today),
                          //   color: primary,
                          //   onPressed: _selectDate,
                          // ),
                        ])),
                  ),
                  // Text(
                  //     'Date sélectionnée : ${DateFormat('yyyy-MM-dd').format(_selectedDate)}'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Container(
                      width: 370,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 5),
                            blurRadius: 3.0,
                          ),
                        ],
                      ),
                      child: DropdownButton<int?>(
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
                        items: nombrePrisesOptions.map((int? value) {
                          return DropdownMenuItem<int?>(
                            value: value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15.0),
                              child: Text(value != null
                                  ? value.toString()
                                  : 'Sélectionner le nom du medecin'),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 15),
                    child: Container(
                      height: 60,
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
                      child: TextFormField(
                        controller: nonbrejourController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: Color(0x00f28482),
                        decoration: const InputDecoration(
                          hintText: 'Motif du rendez vous',
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
