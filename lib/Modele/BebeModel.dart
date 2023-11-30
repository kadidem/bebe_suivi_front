import 'package:bebe_suivi/Modele/GrossesseModele.dart';

class BebeModel {
  String nomPrenom;
  DateTime dateNaissance;
  String sexe;
  GrossesseModel? grossesse;

  BebeModel({
    required this.nomPrenom,
    required this.dateNaissance,
    required this.sexe,
    this.grossesse,
  });

  Map<String, dynamic> toJson() {
    return {
      'nomPrenom': nomPrenom,
      'dateNaissance': dateNaissance.toIso8601String(),
      'sexe': sexe,
      "grossesse": {
        "idGrossesse": grossesse?.idGrossesse,
      } // Assurez-vous que grossesse est converti en JSON si présent
    };
  }

  factory BebeModel.fromJson(Map<String, dynamic> json) {
    return BebeModel(
      nomPrenom: json['nomPrenom'] as String,
      dateNaissance: DateTime.parse(json['dateNaissance'] as String),
      sexe: json['sexe'] as String,
    );
  }
}
