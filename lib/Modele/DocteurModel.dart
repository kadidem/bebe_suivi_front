class DocteurModel {
  final int? idDocteur;
  final String? nomPrenom;
  final String? email;
  final String? motDePasse;
  final int? numero;
  final String? adresse;
  final String? specialiter;
  final String? lieuDeTravail;
  final String? contactDuTravail;
  final String? adresseDuTravail;
  bool valide = false;
  // final int numero;

  DocteurModel(
      {required this.email,
      required this.motDePasse,
      required this.numero,
      required this.adresse,
      required this.idDocteur,
      required this.nomPrenom,
      required this.adresseDuTravail,
      required this.contactDuTravail,
      required this.lieuDeTravail,
      required this.specialiter,
      this.valide = false});

  factory DocteurModel.fromJson(Map<String, dynamic> json) {
    return DocteurModel(
        idDocteur: json['idDocteur'] ?? 0,
        email: json['email'] ?? "",
        motDePasse: json['motDePasse'] ?? "",
        numero: json['numero'] ?? 0,
        nomPrenom: json['nomPrenom'] ?? "",
        adresse: json['adresse'] ?? "",
        adresseDuTravail: json['adresseDuTravail'] ?? "",
        contactDuTravail: json['contactDuTravail'] ?? "",
        lieuDeTravail: json['lieuDeTravail'] ?? "",
        specialiter: json['specialiter'] ?? "",
        valide: json['valide'] ?? false);
  }
}
  //"idDocteur": 1,
    // "nomPrenom": "saran",
    // "email": "sc523644@gmail.com",
    // "motDePasse": "sdghgggghff",
    // "specialiter": "Genycologue",
    // "lieuDeTravail": "Gabriel Toure",
    // "contactDuTravail": "Gabrieltoure@gmail.com",
    // "adresseDuTravail": "asdfghjkl",
    // "valide": false,
    // "numero": 74746643,
    // "adresse": "Lafiabougou"