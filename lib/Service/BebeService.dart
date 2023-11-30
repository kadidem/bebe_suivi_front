// Service BebeService.dart
import 'dart:convert';
import 'package:bebe_suivi/Modele/BebeModel.dart';
import 'package:http/http.dart' as http;

class BebeService {
  Future<bool> createBebe(BebeModel bebeModel) async {
    try {
      // Afficher les données à envoyer dans la console
      print('Données à envoyer: ${jsonEncode(bebeModel.toJson())}');

      final response = await http.post(
        Uri.parse('http://10.0.2.2:8080/bebe/create'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(bebeModel.toJson()),
      );

      if (response.statusCode == 200) {
        // La création a réussi
        print('Bébé ajouté avec succès');
        return true;
      } else {
        // La création a échoué, affichez un message d'erreur ou gérez l'erreur selon vos besoins
        print('Erreur lors de la création du bébé: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Gérez les erreurs d'exception, affichez un message d'erreur ou effectuez des actions nécessaires
      print('Erreur lors de la création du bébé: $e');
      return false;
    }
  }

  Future<List<BebeModel>> getAllBebes() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8080/bebe/read'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse.map((data) => BebeModel.fromJson(data)).toList();
    } else {
      // Gérer les erreurs ici
      print(
          'Erreur lors de la récupération des données : ${response.statusCode}');
      throw Exception('Erreur lors de la récupération des données');
    }
  }
}
