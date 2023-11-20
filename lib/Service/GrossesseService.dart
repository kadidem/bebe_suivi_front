import 'dart:convert';

import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:http/http.dart' as http;

class GrossesseService {
  static Future<GrossesseModel> createGrossesse(
      GrossesseModel grossesse) async {
    // const String apiUrl = 'http://10.0.2.2:8080/grossesse/create';
    const String apiUrl = 'http://localhost:8080/grossesse/create';
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(grossesse.toJson()),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      print('Grossesse ajoutée avec succès');
      return grossesse;
    } else {
      print(
          'Échec de l\'ajout de la grossesse. Statut: ${response.statusCode}');

      // return null;
      throw Exception('Échec de l\'ajout de la grossesse');
    }
  }

  Future<List<GrossesseModel>> getAllGrossesse() async {
    // const String apiUrl = 'http://10.0.2.2:8080/grossesse/read';
    const String apiUrl = 'http://localhost:8080/grossesse/read';
    final response = await http.get(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<GrossesseModel> grossesses =
          jsonResponse.map((json) => GrossesseModel.fromJson(json)).toList();
      print(grossesses);
      return grossesses;
    } else {
      throw Exception('Échec de la récupération des grossesses');
    }
  }
}
