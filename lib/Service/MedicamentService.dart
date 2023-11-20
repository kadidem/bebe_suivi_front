import 'dart:convert';

import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedicamentService {
  Future<http.Response> saveMedicament(
    BuildContext context,
    String nom,
    // DateTime dateDebut,
    int nombrePrises,
    int nbreDeJour,
  ) async {
    // Créer l'URI
    // var uri = Uri.parse("http://10.0.2.2:8080/medicament/create");
    var uri = Uri.parse("http://localhost:8080/medicament/create");
    // En-têtes
    Map<String, String> headers = {"Content-Type": "application/json"};

    // Corps de la requête
    Map data = {
      'nom': nom,
      'nombreDeFoisParJour': nombrePrises,
      'nbreDeJour': nbreDeJour,
      // 'dateDebut': dateDebut,
      // Ajoutez d'autres champs de votre modèle Medicament ici
    };

    // Convertir les données en JSON
    var body = json.encode(data);
    print(body);

    // Effectuer la requête POST
    var response = await http.post(uri, headers: headers, body: body);

    // Retourner la réponse
    if (response.statusCode == 200) {
      print('Médicament ajouté avec succès');
      Navigator.pushReplacement(
        context as BuildContext,
        MaterialPageRoute(
            builder: (context) =>
                Medicament()), // Remplacez Medicament() par votre liste de médicaments
      );
      return (response);
    } else {
      print('Échec de l\'ajout du médicament. Statut: ${response.statusCode}');
      throw Exception('Échec de l\'ajout du médicament');
    }
  }

  Future<List<MedicamentModel>> getAllMedicaments() async {
    // const String apiUrl = 'http://10.0.2.2:8080/medicament/read';
    const String apiUrl = 'http://localhost:8080/medicament/read';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Si la requête a réussi, convertissez la réponse JSON en une liste de MedicamentModel
      List<dynamic> jsonData = json.decode(response.body);
      List<MedicamentModel> medicaments =
          jsonData.map((json) => MedicamentModel.fromJson(json)).toList();

      return medicaments;
    } else {
      // Si la requête a échoué, lancez une exception avec un message d'erreur
      throw Exception(
          'Échec de la récupération des médicaments. Statut: ${response.statusCode}');
    }
  }
}
