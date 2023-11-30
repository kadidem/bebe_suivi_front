import 'dart:convert';

import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:http/http.dart' as http;

class GrossesseService {
  static Future<GrossesseModel> createGrossesse(
      GrossesseModel grossesse) async {
    const String apiUrl = 'http://10.0.2.2:8080/grossesse/create';
    //const String apiUrl = 'http://localhost:8080/grossesse/create';
    try {
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
        throw Exception('Échec de l\'ajout de la grossesse');
      }
    } catch (e) {
      print('Erreur lors de la requête HTTP: $e');
      // Handle the error by displaying a message to the user or taking other actions
      throw Exception('Impossible de se connecter au serveur');
    }
  }

  Future<List<GrossesseModel>> getAllGrossesse() async {
    const String apiUrl = 'http://10.0.2.2:8080/grossesse/read';
    //const String apiUrl = 'http://localhost:8080/grossesse/read';
    try {
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
    } catch (e) {
      print('Erreur lors de la requête HTTP: $e');
      // Handle the error by displaying a message to the user or taking other actions
      throw Exception('Impossible de se connecter au serveur');
    }
  }

  Future<List<GrossesseModel>> getAllGrossesseByIdUser(int userId) async {
    String apiUrl = 'http://10.0.2.2:8080/grossesse/read/user/$userId';

    try {
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

        if (grossesses.isEmpty) {
          // Si la liste est vide, imprimez le message dans la console
          print('Aucune grossesse trouvée pour cet utilisateur');
        } else {
          // Si la liste n'est pas vide, imprimez la liste
          print(grossesses);
        }

        return grossesses;
      } else {
        return <GrossesseModel>[];
      }
    } catch (e) {
      print('Erreur lors de la requête HTTP: $e');
      // Handle the error by displaying a message to the user or taking other actions
      throw Exception('Impossible de se connecter au serveur');
    }
  }

  Future<GrossesseModel?> getGrossesseEnCours(int userId) async {
    final response = await http.get(
      Uri.parse('http://10.0.2.2:8080/grossesse/readEnCours/$userId'),
    );

    if (response.statusCode == 200) {
      // Si la requête est réussie, parsez le corps de la réponse JSON
      // en un objet Grossesse et retournez-le.
      final Map<String, dynamic> data = json.decode(response.body);
      return GrossesseModel.fromJson(data);
    } else if (response.statusCode == 204) {
      // Si la réponse indique "No Content", cela signifie qu'aucune grossesse n'est en cours.
      // Vous pouvez gérer cela en renvoyant null ou une valeur par défaut.
      return null;
    } else {
      // Gérez les autres codes d'état HTTP comme nécessaire.
      throw Exception(
          'Erreur lors de la récupération de la grossesse en cours');
    }
  }
}
