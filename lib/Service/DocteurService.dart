import 'dart:async';
import 'dart:convert';
import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Patient/DocteurAdd.dart';
import 'package:http/http.dart' as http;

class docteurService {
  Future<http.Response> saveDocteur(
      String nomPrenom,
      String email,
      String password,
      String adresse,
      String numero,
      String specialiter,
      String lieuDeTravail,
      String contactDuTravail,
      String adresseDuTravail) async {
    //create uri
    var uri = Uri.parse("http://10.0.2.2:8080/docteur/create");
    //var uri = Uri.parse("http://localhost:8080/docteur/create");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};

    //body
    Map data = {
      'nomPrenom': nomPrenom,
      'email': email,
      'adresse': adresse,
      'numero': numero,
      'motDePasse': password,
      "specialiter": specialiter,
      'lieuDeTravail': lieuDeTravail,
      'contactDuTravail': contactDuTravail,
      'adresseDuTravail': adresseDuTravail
    };

    //convert the above data into json
    var body = json.encode(data);
    print(body);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }

  Future<DocteurModel> loginDocteur(String email, String password) async {
    const apiUrl = 'http://10.0.2.2:8080/docteur/login';
    //const apiUrl = 'http://localhost:8080/docteur/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'motDePasse': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final docteur = DocteurModel.fromJson(responseData);
      print(docteur);
      print("qwertyuytggsd");
      // Retournez l'utilisateur connecté
      return docteur;
    } else {
      // Identifiants invalides
      throw Exception("asdfghjk");
    }
  }

  Future<List<DocteurModel>> getAllDocteurs() async {
    const String apiUrl = 'http://10.0.2.2:8080/docteur/read';
    // const String apiUrl = 'http://localhost:8080/docteur/read';
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
}
