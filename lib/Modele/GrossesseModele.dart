class GrossesseModel {
  final DateTime dateDernierRegle;
  final int poids;
  final int age;

  GrossesseModel({
    required this.dateDernierRegle,
    required this.poids,
    required this.age,
  });

  Map<String, dynamic> toJson() {
    return {
      'dateDernierRegle': dateDernierRegle.toIso8601String(),
      'poids': poids,
      'age': age,
      // Ajoutez d'autres champs si nécessaire
    };
  }
}
