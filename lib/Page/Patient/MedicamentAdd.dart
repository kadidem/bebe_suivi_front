import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/MedicamentService.dart';
import 'package:bebe_suivi/Service/UserService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart'; // Importez le package

class MedicamentAdd extends StatefulWidget {
  MedicamentAdd({super.key});
  @override
  State<MedicamentAdd> createState() => _MedicamentAddState();
}

class _MedicamentAddState extends State<MedicamentAdd> {
  TextEditingController NomController = TextEditingController();
  TextEditingController nonbrefoisController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nonbrejourController = TextEditingController();
  TextEditingController intialdateval = TextEditingController();
  TextEditingController nombrePriseController = TextEditingController();
  // List<int?> nombrePrisesOptions = [null, 1, 2, 3, 4, 5];
  // int? selectedNombrePrises;
  final MedicamentService medicamentService = MedicamentService();
  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2090),
    );
    if (picked != null && picked != DateTime.now()) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  final _formKey = GlobalKey<FormState>();
  bool isConnectionSuccessful = false;
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    UserModel? user = userProvider.user;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Header(),
                ),
                const Text(
                  "Ajouter un medicament",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    // fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  // height: 100,
                  // width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/image/medicament1.png'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                            controller: NomController,
                            validator: MultiValidator([
                              // Utilisez MultiValidator pour plusieurs validations
                              RequiredValidator(
                                  errorText: 'Ce champ est requis'),
                            ]),
                            cursorColor: Color(0x00f28482),
                            decoration: const InputDecoration(
                              hintText: 'Entrer le Nom du medicament',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15.0),
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
                                  cursorColor: Color(0x00f28482),
                                  decoration: const InputDecoration(
                                    hintText:
                                        'Entrez la date debut du traitement',
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 15.0),
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
                                icon: Icon(Icons.calendar_today),
                                //iconSize: 30,
                                color: primary,
                                onPressed: _selectDate,
                              ),
                            ],
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
                          child: TextFormField(
                            controller: nombrePriseController,
                            validator: MultiValidator([
                              // Utilisez MultiValidator pour plusieurs validations
                              RequiredValidator(
                                  errorText: 'Ce champ est requis'),
                            ]),
                            cursorColor: Color(0x00f28482),
                            decoration: const InputDecoration(
                              hintText:
                                  'Entrer le nombre de prise  du medicament',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15.0),
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
                          child: TextFormField(
                            controller: nonbrejourController,
                            validator: MultiValidator([
                              // Utilisez MultiValidator pour plusieurs validations
                              RequiredValidator(
                                  errorText: 'Ce champ est requis'),
                            ]),
                            cursorColor: Color(0x00f28482),
                            decoration: const InputDecoration(
                              hintText: 'Entrez la durée du traitement',
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 15.0),
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
                      ),
                    ],
                  ),
                ),
                CustomButton(
                    text: "Ajouter",
                    onTap: () async {
                      try {
                        MedicamentModel newMedicament = MedicamentModel(
                          nom: NomController.text,
                          dateDebut: dateController.text,
                          nombrePrises: int.parse(nombrePriseController.text),
                          nbreDeJour: int.parse(nonbrejourController.text),
                          user: user,
                        );

                        MedicamentModel createdMedicament =
                            await medicamentService
                                .createMedicament(newMedicament);
                        print(createdMedicament);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Médicament ajouté avec succès!'),
                            backgroundColor: Color(0xFFF28482),
                            elevation: 100,
                          ),
                        );
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Medicament()),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Erreur lors de l\'ajout du médicament.'),
                            backgroundColor: Color(0xFFF28482),
                            elevation: 30,
                          ),
                        );
                      }
                    }),
              ],
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
      )),
    );
  }
}
