import 'dart:convert';

import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:http/http.dart' as http;

class GrossesseService {
  Future<void> createGrossesse(GrossesseModel grossesse) async {
    const String apiUrl = 'http://localhost:8080/grossesse/create';

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(grossesse.toJson()),
    );

    if (response.statusCode == 201) {
      print('Grossesse ajoutée avec succès');
    } else {
      print(
          'Échec de l\'ajout de la grossesse. Statut: ${response.statusCode}');
      throw Exception('Échec de l\'ajout de la grossesse');
    }
  }
}
