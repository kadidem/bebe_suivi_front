// Service BebeService.dart
import 'dart:convert';
import 'package:bebe_suivi/Modele/BebeModel.dart';
import 'package:http/http.dart' as http;

class BebeService {
  // static const String baseUrl = 'http://10.0.2.2:8080/bebe/create';
  static const String baseUrl = 'http://localhost:8080/bebe/create';
  Future<void> createBebe(BebeMoedel bebeMoedel) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nomPrenom': bebeMoedel.nomPrenom,
        'dateNaissance': bebeMoedel.dateNaissance,
        'sexe': bebeMoedel.sexe,
      }),
    );

    if (response.statusCode == 201) {
      print('Bébé ajouté avec succès');
    } else {
      throw Exception('Échec de l\'ajout du bébé');
    }
  }
}
