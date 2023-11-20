import 'package:bebe_suivi/Modele/GrossesseModele.dart';

class BebeMoedel {
  String nomPrenom;
  String dateNaissance;
  String sexe;
  GrossesseModel grossesse;
  BebeMoedel({
    required this.nomPrenom,
    required this.dateNaissance,
    required this.sexe,
    required this.grossesse,
  });
}
