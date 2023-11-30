import 'package:bebe_suivi/Modele/UserModel.dart';

class MedicamentModel {
  int? idMedicament;
  String nom;
  int? nombrePrises;
  String dateDebut;
  int? nbreDeJour;
  String? dateFin;
  final UserModel? user;

  MedicamentModel({
    required this.nom,
    required this.nombrePrises,
    required this.nbreDeJour,
    required this.dateDebut,
    this.idMedicament,
    this.dateFin,
    required this.user,
  });

  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'nombreDeFoisParJour':
          nombrePrises, // Removed the extra double quote here
      'dateDebut': dateDebut,
      'nbreDeJour': nbreDeJour,
      'idMedicament': idMedicament,
      'dateFin': dateFin,
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

  factory MedicamentModel.fromJson(Map<String, dynamic> json) {
    return MedicamentModel(
      nom: json['nom'],
      nombrePrises: json['nombreDeFoisParJour'],
      nbreDeJour: json['nbreDeJour'],
      dateDebut: json['dateDebut'],
      idMedicament: json['idMedicament'],
      user: UserModel.fromJson(json['user']),
    );
  }
}
