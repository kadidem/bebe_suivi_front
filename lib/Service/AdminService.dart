import 'dart:async';
import 'dart:convert';
import 'package:bebe_suivi/Modele/AdminModel.dart';
import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:http/http.dart' as http;

class AdminService {
  Future<AdminModel> loginAdmin(String email, String password) async {
    // const apiUrl = 'http://10.0.2.2:8080/user/login';
    const apiUrl = 'http://localhost:8080/Admin/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'motDePasse': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final admin = AdminModel.fromJson(responseData);
      print(admin);
      print("qwertyuytggsd");
      // Retournez l'utilisateur connecté
      return admin;
    } else {
      // Identifiants invalides
      throw Exception("asdfghjk");
    }
  }

  // Future<List<DocteurModel>> getAllDocteur() async {
  //   final response =
  //       await http.get(Uri.parse('http://localhost:8080/docteur/read'));
  //   print(response.body);
  //   if (response.statusCode == 200) {
  //     // Si la requête réussit, parsez le JSON et renvoyez la liste des docteurs
  //     return (json.decode(response.body) as List)
  //         .map((data) => DocteurModel.fromJson(data))
  //         .toList();
  //   } else {
  //     // Si la requête échoue, lancez une exception
  //     throw Exception('Échec de la récupération des docteurs');
  //   }
  // }
  Future<List<DocteurModel>> getAllDocteurs() async {
    //const String apiUrl = 'http://10.0.2.2:8080/docteur/read';
    const String apiUrl = 'http://localhost:8080/docteur/read';
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      // Si la requête a réussi, convertissez la réponse JSON en une liste de DocteurModel
      List<dynamic> jsonData = json.decode(response.body);
      // print(jsonData.toString());
      List<DocteurModel> docteurs =
          jsonData.map((json) => DocteurModel.fromJson(json)).toList();
      // print(docteurs);
      return docteurs;
    } else {
      // Si la requête a échoué, lancez une exception avec un message d'erreur
      throw Exception(
          'Échec de la récupération des docteurs. Statut: ${response.statusCode}');
    }
  }

  Future<http.Response> validateDoctor(int docteurId) async {
    // Créer l'URI pour la validation du docteur
    var uri = Uri.parse("http://localhost:8080/docteur/validate/$docteurId");

    // En-têtes
    Map<String, String> headers = {"Content-Type": "application/json"};

    // Corps de la requête
    Map data = {
      'docteurId': docteurId,
    };

    // Convertir les données en JSON
    //var body = json.encode(data);

    // Effectuer la requête POST
    var response = await http.put(uri, headers: headers);

    // Retourner la réponse
    return response;
  }
}
