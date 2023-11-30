import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseAcceuil1.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseListe.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Grossesse extends StatefulWidget {
  const Grossesse({Key? key}) : super(key: key);

  @override
  _GrossesseState createState() => _GrossesseState();
}

class _GrossesseState extends State<Grossesse> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController poidsController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final GrossesseService grossesseService = GrossesseService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();
  Future<void> _selectDate() async {
    _selectedDate = await showDatePicker(
          context: context,
          initialDate: _selectedDate,
          firstDate: DateTime(2000),
          lastDate: DateTime(2060),
        ) ??
        _selectedDate;
    setState(() {
      dateController.text = DateFormat('yyyy-MM-dd').format(_selectedDate);
    });
  }

  // String? poidValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "Champ requis !";
  //   }

  //   int poids = int.tryParse(value) ?? 0;
  //   if (poids < 40 || poids > 150) {
  //     return "Poids incorrecte";
  //   }

  //   return null;
  // }

  String? poidControllerValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Le poid est requis !";
    }

    int poids = int.tryParse(value) ?? 0;
    if (poids < 40 || poids > 150) {
      return "Le poids est incorrecte";
    }
    return null;
  }

  String? ageControllerValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "L'age  est requis !";
    }

    int age = int.tryParse(value) ?? 0;
    if (age < 16 || age > 50) {
      return "L'age  est incorrecte";
    }
    return null;
  }

  // String? dateControllerValidator(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return "La date  est requis !";
  //   }
  //   return null;
  // }

  bool validateForm() {
    String? poidsValide = poidControllerValidator(poidsController.text);
    if (poidsValide != null) {
      showMessage(poidsValide);
      return false;
    }
    String? ageValide = ageControllerValidator(ageController.text);
    if (ageValide != null) {
      showMessage(ageValide);
      return false;
    }

    // String? dateValide = dateControllerValidator(dateController.text);
    // if (dateValide != null) {
    //   showMessage(dateValide);
    //   return false;
    // }
    return true;
  }

  Future<void> showMessage(String error) async {
    await showDialog(
        context: context,
        builder: (_) => AlertDialog(
              icon: const Icon(
                Icons.warning,
                size: 100,
              ),
              title: Text(error),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Ok"))
              ],
            ));
  }

  @override
  void initState() {
    dateController.text = "Selectionner une date";
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    ageController.dispose();
    poidsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    UserModel? user = userProvider.user;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: 200,
              right: 0,
              child: Image.asset("assets/image/biberon.png"),
            ),
            Positioned(
              top: 150,
              right: 20,
              child: Image.asset(
                "assets/image/pied.png",
                width: 60,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: 20,
              child: Image.asset(
                "assets/image/test.png",
                width: 90,
              ),
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: const Header(),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Expanded(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            const Text(
                              "Ajouter grossesse",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              height: 100,
                              child: Center(
                                child: Image.asset(
                                  "assets/image/foetus.png",
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 15,
                              ),
                              padding: const EdgeInsets.only(left: 5),
                              height: 50,
                              width: 370,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                //borderRadius: BorderRadius.circular(40.0),
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
                                      child: InkWell(
                                          onTap: _selectDate,
                                          child: Text(
                                            dateController.text,
                                            textAlign: TextAlign.center,
                                          ))),
                                  IconButton(
                                    icon: const Icon(Icons.calendar_today),
                                    onPressed: _selectDate,
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 5),
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: poidsController,
                                decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Saisissez votre poids actuel"),
                                //validator: poidValidator,
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              width: 300,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 5),
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              child: TextFormField(
                                controller: ageController,
                                decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Saisissez votre âge",
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            CustomButton(
                              text: "Ajouter",
                              onTap: () async {
                                if (validateForm()) {
                                  print(dateController.text);
                                  print(DateTime.parse(dateController.text));
                                  GrossesseModel grossesseModel =
                                      GrossesseModel(
                                          dateDernierRegle: dateController.text,
                                          poids:
                                              int.parse(poidsController.text),
                                          age: int.parse(ageController.text),
                                          user: user);
                                  if (GrossesseService.createGrossesse(
                                          grossesseModel) ==
                                      true) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              GrossesseListe()),
                                    );
                                  }
                                }
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
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
    );
  }
}
