import 'package:bebe_suivi/Page/Demarrage.dart';
import 'package:bebe_suivi/Page/Inscription.dart';
import 'package:bebe_suivi/Page/header.dart';
import 'package:bebe_suivi/Page/footer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const Inscription());
  }
}
