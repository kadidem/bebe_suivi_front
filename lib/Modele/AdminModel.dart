class AdminModel {
  final int idAdmin;
  final String nomPrenom;
  final String email;
  final String motDePasse;

  AdminModel(
      {required this.email,
      required this.motDePasse,
      required this.idAdmin,
      required this.nomPrenom});

  factory AdminModel.fromJson(Map<String, dynamic> json) {
    return AdminModel(
      idAdmin: json['idAdmin'],
      email: json['email'],
      motDePasse: json['motDePasse'],
      nomPrenom: json['nomPrenom'],
    );
  }
}
