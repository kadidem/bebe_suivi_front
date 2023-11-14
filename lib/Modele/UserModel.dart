class UserModel {
  final int idUser;
  final String nom_prenom;
  final String email;
  final String motDePasse;
  final int Numero;
  final String adresse;

  UserModel(
      {required this.email,
      required this.motDePasse,
      required this.Numero,
      required this.adresse,
      required this.idUser,
      required this.nom_prenom});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        idUser: json['idUser'],
        email: json['email'],
        motDePasse: json['motDePasse'],
        Numero: json['numero'],
        nom_prenom: json['nom_prenom'],
        adresse: json['adresse']);
  }
}
