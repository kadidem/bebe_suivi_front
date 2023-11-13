class UserModel {
  final String email;
  final String motDePasse;

  UserModel({
    required this.email,
    required this.motDePasse,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'],
      motDePasse: json['motDePasse'],
    );
  }
}
