import 'package:bebe_suivi/Modele/UserModel.dart';

class GrossesseModel {
  final int? idGrossesse;
  final String dateDernierRegle;
  final int poids;
  final int age;
  final DateTime? dateAcouchement;
  final UserModel? user;

  GrossesseModel({
    this.idGrossesse,
    required this.dateDernierRegle,
    this.dateAcouchement,
    required this.poids,
    required this.age,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      "idGrossesse": idGrossesse,
      "dateDernierRegle": dateDernierRegle,
      "poids": poids,
      "age": age,
      'dateAcouchement': dateAcouchement?.toIso8601String(),
      "user": {
        "idUser": user?.idUser,
        // "nom_prenom": user.nom_prenom,
        // "email": user.email,
        // "motDePasse": "1234567",
        // "numero": 74746643,
        // "adresse": "Lafiabougou"
      }
    };
  }

  factory GrossesseModel.fromJson(Map<String, dynamic> json) {
    return GrossesseModel(
      idGrossesse: json['idGrossesse'],
      dateDernierRegle: json['dateDernierRegle'],
      poids: json['poids'],
      age: json['age'],
      dateAcouchement: json['dateAcouchement'] != null
          ? DateTime.parse(json['dateAcouchement'])
          : null,
      user: UserModel.fromJson(json['user']),
    );
  }
}
