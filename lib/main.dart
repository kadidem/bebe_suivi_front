//import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Admin/Acceuilpage.dart';
import 'package:bebe_suivi/Admin/ConnexionAdmin.dart';
import 'package:bebe_suivi/Admin/Inscription.dart';
import 'package:bebe_suivi/Page/Demarrage.dart';
import 'package:bebe_suivi/Page/Docteur/AcceuilDoc.dart';
import 'package:bebe_suivi/Page/Docteur/DemandeRdv.dart';
import 'package:bebe_suivi/Page/Docteur/ListeRdv.dart';
import 'package:bebe_suivi/Page/Docteur/Navigationdoc.dart';
import 'package:bebe_suivi/Page/Docteur/listePatient.dart';
import 'package:bebe_suivi/Page/GrossesseProvide.dart';
import 'package:bebe_suivi/Page/Patient/BebeAcceuil.dart';
import 'package:bebe_suivi/Page/Patient/BebeAdd.dart';
import 'package:bebe_suivi/Page/Patient/Calendar.dart';
import 'package:bebe_suivi/Page/Patient/MedicamentAdd.dart';
import 'package:bebe_suivi/Page/Patient/MedicamentProvider.dart';
import 'package:bebe_suivi/Page/Patient/test.dart';
// import 'package:bebe_suivi/Page/Patient/AddRendezvous.dart';
// import 'package:bebe_suivi/Page/Patient/Bebe.dart';
// import 'package:bebe_suivi/Page/Patient/BebeAcceuil.dart';
// import 'package:bebe_suivi/Page/Patient/BebeAdd.dart';
// import 'package:bebe_suivi/Page/Patient/Docteur.dart';
// import 'package:bebe_suivi/Page/Patient/DocteurAdd.dart';
// import 'package:bebe_suivi/Page/Patient/Forum.dart';
// import 'package:bebe_suivi/Page/Patient/ForumAdd.dart';
// import 'package:bebe_suivi/Page/Patient/Forumdisc.dart';
// import 'package:bebe_suivi/Page/Patient/Medicament.dart';
// import 'package:bebe_suivi/Page/Patient/Navigation.dart';
// import 'package:bebe_suivi/Page/Patient/Profil.dart';
// import 'package:bebe_suivi/Page/Patient/Rappel.dart';
// import 'package:bebe_suivi/Page/Patient/RendezvousDetail.dart';
// import 'package:bebe_suivi/Page/Patient/VaccinAdd.dart';
// import 'package:bebe_suivi/Page/Patient/VaccinPoid.dart';
// import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  if (!kIsWeb) {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider(create: (_) => GrossesseProvider()),
        ChangeNotifierProvider(create: (_) => MedicamentProvider()),
      ],
      child: const MyApp(),
    ));
  } else {
    runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AdminProvider()),
      ],
      child: const MyAppDash(),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bebesuivi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          useMaterial3: true,
        ),
        home: const Demarrage());
  }
}

class MyAppDash extends StatelessWidget {
  const MyAppDash({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'bebesuivi',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: primary),
          useMaterial3: true,
        ),
        home: ConnexionAdmin());
  }
}
