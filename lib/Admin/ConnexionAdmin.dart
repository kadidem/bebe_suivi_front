import 'package:bebe_suivi/Admin/Acceuilpage.dart';
import 'package:bebe_suivi/Modele/AdminModel.dart';
import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Service/AdminService.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:bebe_suivi/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:provider/provider.dart';

class ConnexionAdmin extends StatefulWidget {
  ConnexionAdmin({super.key});

  @override
  State<ConnexionAdmin> createState() => _ConnexionAdminState();
}

class _ConnexionAdminState extends State<ConnexionAdmin> {
  AdminService service = AdminService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.width * 0.5,
            width: MediaQuery.of(context).size.width * 0.5,
            color: primary,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.3,
              //height: 300,
              child: Column(
                children: [
                  Center(child: Image.asset("assets/image/logo.png")),
                  // Material(
                  //   elevation: 12,
                  //   shape: const RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.all(Radius.circular(12))),
                  //   child: Container(
                  //     decoration: const BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.all(Radius.circular(12))),
                  //     child: SizedBox(
                  //         width: MediaQuery.of(context).size.width * .3,
                  //         height: 60,
                  //         child: TextFormField(
                  //           decoration: const InputDecoration(
                  //               hintText: "Entrer votre nom et prénom",
                  //               prefixIcon: Icon(
                  //                 Icons.person,
                  //                 size: 20,
                  //               ),
                  //               contentPadding: EdgeInsets.only(left: 5),
                  //               border: OutlineInputBorder(
                  //                   borderSide: BorderSide.none)),
                  //         )),
                  //   ),
                  // ),
                  const SizedBox(
                    height: 10,
                  ),

                  Form(
                    key: _formKey,
                    child: Material(
                      elevation: 12,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(12))),
                        child: SizedBox(
                            width: MediaQuery.of(context).size.width * .3,
                            height: 60,
                            child: TextFormField(
                              controller: emailController,
                              validator: MultiValidator([
                                // Utilisez MultiValidator pour plusieurs validations
                                RequiredValidator(
                                    errorText: 'Ce champ est requis'),
                              ]),
                              decoration: const InputDecoration(
                                  hintText: "Entrer votre email",
                                  prefixIcon: Icon(
                                    Icons.email,
                                    size: 20,
                                  ),
                                  contentPadding: EdgeInsets.only(left: 5),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            )),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Material(
                    elevation: 12,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 60,
                          child: TextFormField(
                            controller: passwordController,
                            validator: MultiValidator([
                              // Utilisez MultiValidator pour plusieurs validations
                              RequiredValidator(
                                  errorText: 'Ce champ est requis'),
                            ]),
                            obscureText: true,
                            decoration: const InputDecoration(
                                hintText: "Entrer votre mot de passe",
                                prefixIcon: Icon(
                                  Icons.password,
                                  size: 20,
                                ),
                                contentPadding: EdgeInsets.only(left: 5),
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                      width: 200,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          try {
                            // Appeler la méthode loginUser du service
                            final AdminModel? admin = await service.loginAdmin(
                                emailController.text, passwordController.text);
                            print(admin);

                            if (admin != null) {
                              Provider.of<AdminProvider>(context, listen: false)
                                  .setAdmin(admin);

                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Connexion réussie'),
                                    content:
                                        Text('Bienvenue, ${admin.nomPrenom}!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  const Acceuilpage(),
                                            ),
                                          );
                                          // Navigator.push(
                                          //   context,
                                          //   MaterialPageRoute(
                                          //       builder: (context) =>
                                          //           const Navigation()),
                                          // );
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              // Gérer le cas où loginUser renvoie null
                              print('Erreur de connexion : utilisateur null');
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                      'Erreur de connexion. Veuillez réessayer.'),
                                ),
                              );
                            }
                          } catch (e) {
                            // Gérer les erreurs de connexion
                            print('Erreur de connexion : $e');
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Erreur de connexion. Veuillez réessayer.')),
                            );
                          }
                        },
                        child: const Text(
                          'Se connecter',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ))
                ],
              ),
            )),
      ),
    );
  }
}
