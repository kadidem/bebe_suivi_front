import 'package:bebe_suivi/Admin/Acceuilpage.dart';
import 'package:bebe_suivi/Admin/ConnexionAdmin.dart';
import 'package:bebe_suivi/Page/Connexion.dart';
import 'package:bebe_suivi/utils/constants.dart';
import 'package:flutter/material.dart';

class HeaderAdmin extends StatelessWidget {
  const HeaderAdmin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: primary,
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Acceuilpage()));
                  },
                  child: const Text(
                    "Accueil",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))),
          const SizedBox(
            width: 50,
          ),
          SizedBox(
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ConnexionAdmin()));
                  },
                  child: const Text(
                    "Deconnexion",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    );
  }
}
