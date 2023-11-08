import 'package:flutter/material.dart';

class AcceuilPatient extends StatefulWidget {
  const AcceuilPatient({super.key});

  @override
  State<AcceuilPatient> createState() => _AcceuilPatientState();
}

class _AcceuilPatientState extends State<AcceuilPatient> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              SizedBox(
                height: 50,
                //  width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/image/logo.png'),
              ),
              const SizedBox(width: 260),
              SizedBox(
                height: 50,
                //width: MediaQuery.of(context).size.width,
                child: Image.asset('assets/image/logo.png'),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
