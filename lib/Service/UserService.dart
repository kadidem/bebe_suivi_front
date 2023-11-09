import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class userService {
  //create the method to save user

  Future<http.Response> saveUser(String nom_prenom, String email,
      String password, String adresse, String numero) async {
    //create uri
    var uri = Uri.parse("http://localhost:8080/user/create");
    //header
    Map<String, String> headers = {"Content-Type": "application/json"};

    //body
    Map data = {
      'nom_prenom': nom_prenom,
      'email': email,
      'adresse': adresse,
      'numero': numero,
      'motDePasse': password,
    };
    //convert the above data into json
    var body = json.encode(data);
    print(body);
    var response = await http.post(uri, headers: headers, body: body);

    //print the response body
    print("${response.body}");

    return response;
  }

  Future<void> saveUserInfo(String responseJson, email, password) async {
    final jsonResponse = json.decode(responseJson);

    final userId = jsonResponse['idUser'];
    final email = jsonResponse['email'];
    final password = jsonResponse['motDePasse'];

    final prefs = await SharedPreferences.getInstance();
    prefs.setString('idUser', userId.toString());
    prefs.setString('email', email);
    prefs.setString('motDePasse', password);
  }

  Future loginUser(String email, String password) async {
    const apiUrl = 'http://localhost:8080/user/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'motDePasse': password,
      },
    );

    debugPrint(response.body);
    print(response);
    if (response.statusCode == 200) {
      // Connexion réussie
      return response.body;
      print('Connexion réussie');
    } else {
      // Identifiants invalides
      print('Identifiants invalides');
    }
  }
}
