import 'dart:convert';

import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MedicamentService {
  Future<MedicamentModel> createMedicament(MedicamentModel medicament) async {
    const String apiUrl = "http://10.0.2.2:8080/medicament/create";
    //const String apiUrl = 'http://localhost:8080/grossesse/create';
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: json.encode(medicament.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('Grossesse ajoutée avec succès');
        return medicament;
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
  // Future<http.Response> saveMedicament(
  //   BuildContext context,
  //   String nom,
  //   String dateDebut,
  //   int nombrePrises,
  //   int nbreDeJour,
  // ) async {
  //   // Créer l'URI
  //   var uri = Uri.parse("http://10.0.2.2:8080/medicament/create");
  //   //var uri = Uri.parse("http://localhost:8080/medicament/create");
  //   // En-têtes
  //   Map<String, String> headers = {"Content-Type": "application/json"};

  //   // Corps de la requête
  //   Map data = {
  //     'nom': nom,
  //     'nombreDeFoisParJour': nombrePrises,
  //     'nbreDeJour': nbreDeJour,
  //     'dateDebut': dateDebut,
  //   };

  //   // Convertir les données en JSON
  //   var body = json.encode(data);
  //   print(body);

  //   // Effectuer la requête POST
  //   var response = await http.post(uri, headers: headers, body: body);

  //   // Retourner la réponse
  //   if (response.statusCode == 200) {
  //     print('Médicament ajouté avec succès');
  //     Navigator.pushReplacement(
  //       context as BuildContext,
  //       MaterialPageRoute(
  //           builder: (context) =>
  //               Medicament()), // Remplacez Medicament() par votre liste de médicaments
  //     );
  //     return (response);
  //   } else {
  //     print('Échec de l\'ajout du médicament. Statut: ${response.statusCode}');
  //     throw Exception('Échec de l\'ajout du médicament');
  //   }
  // }

  Future<List<MedicamentModel>> getAllMedicaments() async {
    const String apiUrl = 'http://10.0.2.2:8080/medicament/read';
    //const String apiUrl = 'http://localhost:8080/medicament/read';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Si la requête a réussi, convertissez la réponse JSON en une liste de MedicamentModel
      List<dynamic> jsonData = json.decode(response.body);
      List<MedicamentModel> medicaments =
          jsonData.map((json) => MedicamentModel.fromJson(json)).toList();

      return medicaments;
    } else {
      return <MedicamentModel>[];
    }
  }

  Future<List<MedicamentModel>> getAllMedicamentByIdUser(int userId) async {
    String apiUrl = 'http://10.0.2.2:8080/read/medicement/$userId';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        List<MedicamentModel> medicaments =
            jsonResponse.map((json) => MedicamentModel.fromJson(json)).toList();

        if (medicaments.isEmpty) {
          // Si la liste est vide, imprimez le message dans la console
          print('Aucune grossesse trouvée pour cet utilisateur');
        } else {
          // Si la liste n'est pas vide, imprimez la liste
          print(medicaments);
        }

        return medicaments;
      } else {
        return <MedicamentModel>[];
      }
    } catch (e) {
      print('Erreur lors de la requête HTTP: $e');
      // Handle the error by displaying a message to the user or taking other actions
      throw Exception('Impossible de se connecter au serveur');
    }
  }

  Future<void> editMedicament(MedicamentModel medicament) async {
    const String apiUrl = 'http://10.175.48.14:8080/medicament/update';
    print("modification = ${medicament.idMedicament}");

    try {
      final response = await http.put(
        Uri.parse('$apiUrl'), // Include idMedicament in the URL
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(medicament.toJson()),
      );

      if (response.statusCode == 200) {
        // The modification was successful, you can process the response if needed
        print('Médicament modifié avec succès');
      } else {
        // The modification failed, display an error message or handle the error as needed
        print('$apiUrl/${medicament.idMedicament}');
        print(
            'Erreur lors de la modification du médicament: ${response.statusCode}');
      }
    } catch (e) {
      // Handle exception errors, display an error message, or take necessary actions
      print('$apiUrl/${medicament.idMedicament}');
      print('Erreur lors de la modification du médicament: $e');
    }
  }
}
