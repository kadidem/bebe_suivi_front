import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseAcceuil1.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseListe.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:intl/intl.dart';

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
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Header(),
                ),
                Expanded(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: Expanded(
                      child: Column(
                        children: [
                          const Text("Ajouter grossesse"),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                "assets/image/foetus.png",
                                width: 90,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
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
                                            'Entrez la date du 1er jour des dernières règles',
                                        contentPadding: EdgeInsets.symmetric(
                                            horizontal: 15.0),
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
                                    icon: Icon(Icons.calendar_today),
                                    onPressed: _selectDate,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(20),
                            child: TextField(
                              controller: poidsController,
                              decoration: InputDecoration(
                                hintText: "Saisissez votre poids actuel",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Material(
                            elevation: 20,
                            borderRadius: BorderRadius.circular(20),
                            child: TextField(
                              controller: ageController,
                              decoration: InputDecoration(
                                hintText: "Saisissez votre âge",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  borderSide: BorderSide(color: Colors.grey),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          CustomButton(
                            text: "Ajouter",
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GrossesseListe()),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
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
            Positioned(
              top: 16, // Ajustez ces valeurs selon votre mise en page
              left: 16,
              child: IconButton(
                  icon: Icon(
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
