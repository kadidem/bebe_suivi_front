import 'package:bebe_suivi/Page/Patient/Bebe.dart';
import 'package:bebe_suivi/Page/Patient/VaccinListe.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

class VaccinAdd extends StatefulWidget {
  const VaccinAdd({super.key});

  @override
  State<VaccinAdd> createState() => _VaccinAddState();
}

class _VaccinAddState extends State<VaccinAdd> {
  TextEditingController emailController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nonbrejourController = TextEditingController();
  TextEditingController intialdateval = TextEditingController();
  List<String?> nombrePrisesOptions = [
    null,
    'BCG +polio 0',
    'Pental 1 +Rota 1+ Pneumo 1',
    'Pental 2 +Rota 2 + Pneumo 2',
    'Pental 2 +Rota 2 + Pneumo 3',
    'Rougeole',
    'Fievre Jaune',
    'Men A',
    'Polio 1',
    'Polio 2',
    'Polio 3',
    'Vitamine A',
    'Albendazole'
  ];
  String? selectedVaccin;
  List<String?> statusOptions = [null, 'OK', 'NON OK'];
  String? selectedstatusPrises;
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
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  child: Image.asset('assets/image/seringue.png'),
                ),
                const Text(
                  "Ajout Vaccin",
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          child: Container(
                            margin: EdgeInsets.all(8),
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
                              value: selectedVaccin,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedVaccin = newValue;
                                });
                              },
                              underline: Container(
                                height: 0,
                              ),
                              icon: const Icon(
                                Icons
                                    .arrow_drop_down, // Icône par défaut de la flèche vers le bas
                                color: primary,
                                size: 50,
                                // Changer la couleur de l'icône ici
                              ),
                              items: nombrePrisesOptions.map((String? value) {
                                return DropdownMenuItem<String?>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(value != null
                                        ? value.toString()
                                        : 'Sélectionner le vaccin '),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            child: Container(
                              height: 55,
                              width: 380,
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
                              child: Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(selectedVaccin ?? '')),
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          child: Container(
                            margin: EdgeInsets.all(8),
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
                                      hintText: 'Entrez la date',
                                      //contentPadding:
                                      //  EdgeInsets.symmetric(horizontal: 15.0),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.calendar_today),
                                  color: primary,
                                  onPressed: _selectDate,
                                  iconSize: 30,
                                ),
                              ],
                            ),
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
                              value: selectedstatusPrises,
                              onChanged: (newValue) {
                                setState(() {
                                  selectedstatusPrises = newValue;
                                });
                              },
                              underline: Container(
                                // Utilisez un Container pour masquer la ligne
                                height: 0,
                              ),
                              icon: const Icon(
                                Icons
                                    .arrow_drop_down, // Icône par défaut de la flèche vers le bas
                                color: primary,
                                size: 50,
                                // Changer la couleur de l'icône ici
                              ),
                              items: statusOptions.map((String? value) {
                                return DropdownMenuItem<String?>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15.0),
                                    child: Text(value != null
                                        ? value.toString()
                                        : 'Sélectionner le status du vaccin'),
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
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VaccinListe()),
                    );
                  },
                ),
              ]),
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
      ),
    );
  }
}
