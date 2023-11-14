import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/Page/Patient/AddRendezvous.dart';
import 'package:bebe_suivi/Page/Patient/Bebe.dart';
import 'package:bebe_suivi/Page/Patient/BebeAdd.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:bebe_suivi/Page/Patient/Navigation.dart';
import 'package:bebe_suivi/Page/Patient/Profil.dart';
import 'package:bebe_suivi/Page/Patient/RendezvousDetail.dart';
import 'package:bebe_suivi/Page/Patient/VaccinAdd.dart';
import 'package:bebe_suivi/Page/Patient/grossesse.dart';
import 'package:bebe_suivi/UserProvider.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => UserProvider(),
    child: MyApp(),
  ));
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
        home: const Navigation());
  }
}
