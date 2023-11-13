class MedicamentModel {
  String nom;
  int? nombrePrises;
  //DateTime dateDebut;
  int? nbreDeJour; // ou nbreDeJour, assurez-vous d'adapter selon votre modèle

  // Constructeur de la classe
  MedicamentModel({
    required this.nom,
    required this.nombrePrises,
    required this.nbreDeJour,
  });

  // Méthode pour convertir l'objet en JSON
  Map<String, dynamic> toJson() {
    return {
      'nom': nom,
      'nombrePrises': nombrePrises,
      //'dateDebut': dateDebut.toIso8601String(),
      'nbreDeJour': nbreDeJour,
    };
  }

  factory MedicamentModel.fromJson(Map<String, dynamic> json) {
    return MedicamentModel(
      // Initialiser les propriétés du médicament à partir du JSON
      nom: json['nom'],
      nombrePrises: json['nombrePrises'],
      nbreDeJour: json['nbreDeJour'],
      // Ajouter d'autres propriétés si nécessaire
    );
  }
}
