import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/MedicamentService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class MedicamentEdit extends StatefulWidget {
  final MedicamentModel medicament;
  const MedicamentEdit({required this.medicament, Key? key}) : super(key: key);

  @override
  State<MedicamentEdit> createState() => _MedicamentEditState();
}

class _MedicamentEditState extends State<MedicamentEdit> {
  TextEditingController NomController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController nonbrejourController = TextEditingController();
  TextEditingController nombrePriseController = TextEditingController();

  // List<int?> nombrePrisesOptions = [null, 1, 2, 3, 4, 5];
  // int? selectedNombrePrises;
  final MedicamentService medicamentService = MedicamentService();

  @override
  void initState() {
    super.initState();

    // Initialisez les contrôleurs avec les données du médicament sélectionné
    NomController.text = widget.medicament.nom;
    dateController.text = widget.medicament
        .dateDebut; // Assurez-vous que la propriété dateDebut est de type String
    nombrePriseController.text = widget.medicament.nombrePrises.toString();
    nonbrejourController.text = widget.medicament.nbreDeJour
        .toString(); // Assurez-vous que la propriété duree est de type int
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    UserModel? user = userProvider.user;
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
              child: Stack(children: [
        Column(children: [
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
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: Color(0x00f28482),
                        decoration: const InputDecoration(
                          hintText: 'Entrer le Nom du medicament',
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
                      child: TextFormField(
                        controller: dateController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: Color(0x00f28482),
                        decoration: const InputDecoration(
                          hintText: 'Entrer le Nom du medicament',
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
                      child: TextFormField(
                        controller: nombrePriseController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: Color(0x00f28482),
                        decoration: const InputDecoration(
                          hintText: 'Entrer le Nom du medicament',
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
                      child: TextFormField(
                        controller: nonbrejourController,
                        validator: MultiValidator([
                          // Utilisez MultiValidator pour plusieurs validations
                          RequiredValidator(errorText: 'Ce champ est requis'),
                        ]),
                        cursorColor: Color(0x00f28482),
                        decoration: const InputDecoration(
                          hintText: 'Entrer le Nom du medicament',
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
                  CustomButton(
                    text: "Modifier",
                    onTap: () async {
                      print("clické me");
                      if (_formKey.currentState!.validate()) {
                        try {
                          print(NomController.text);
                          print(nombrePriseController.text);
                          print(nonbrejourController.text);
                          // Créer un nouvel objet MedicamentModel avec les données du formulaire
                          MedicamentModel medicament = MedicamentModel(
                              idMedicament: widget.medicament.idMedicament,
                              nom: NomController.text,
                              nombrePrises:
                                  int.parse(nombrePriseController.text),
                              nbreDeJour: int.parse(nonbrejourController.text),
                              dateDebut: dateController.text,
                              user: user);
                          medicament.idMedicament;
                          medicament.dateFin;
                          // MedicamentModel(
                          //   nom: NomController.text,
                          //   nbreDeJour: dateController.toString(),

                          //   // Assurez-vous de fournir les autres propriétés nécessaires pour la création de l'objet
                          //   // ...
                          // );
                          print(medicament.nom);
                          await medicamentService.editMedicament(medicament);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Médicament modifié avec succès!'),
                              backgroundColor: Color(0xFFF28482),
                              elevation: 100,
                            ),
                          );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Medicament()),
                          );
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Erreur lors de la modification du médicament.'),
                              backgroundColor: Color(0xFFF28482),
                              elevation: 30,
                            ),
                          );
                        }
                      }
                    },
                  )
                ]),
            // onTap: () async {
            //   if (_formKey.currentState!.validate()) {
            //     try {
            //       await medicamentService.saveMedicament(
            //         context,
            //         NomController.text,
            //         (dateController.text).toString(),
            //         selectedNombrePrises ?? 0,
            //         int.parse(nonbrejourController.text),
            //       );
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text('Médicament ajouté avec succès!'),
            //           backgroundColor: Color(0xFFF28482),
            //           elevation: 100,
            //         ),
            //       );
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => Medicament()),
            //       );
            //     } catch (e) {
            //       ScaffoldMessenger.of(context).showSnackBar(
            //         const SnackBar(
            //           content: Text(
            //               'Erreur lors de l\'ajout du médicament.'),
            //           backgroundColor: Color(0xFFF28482),
            //           elevation: 30,
            //         ),
            //       );
            //     }
            //   }
            // },
          )
        ])
      ]))),
    );
  }
}
