import 'dart:async';
import 'dart:convert';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:http/http.dart' as http;

class userService {
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

  Future<UserModel> loginUser(String email, String password) async {
    const apiUrl = 'http://localhost:8080/user/login';

    final response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'email': email,
        'motDePasse': password,
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      final user = UserModel.fromJson(responseData);
      print(user);
      print("qwertyuytggsd");
      // Retournez l'utilisateur connecté
      return user;
    } else {
      // Identifiants invalides
      throw Exception("asdfghjk");
    }
  }

  //create the method to save user

  // Future<http.Response> saveUser(String nom_prenom, String email,
  //     String password, String adresse, String numero) async {
  //   //create uri
  //   var uri = Uri.parse("http://localhost:8080/user/create");
  //   //header
  //   Map<String, String> headers = {"Content-Type": "application/json"};

  //   //body
  //   Map data = {
  //     'nom_prenom': nom_prenom,
  //     'email': email,
  //     'adresse': adresse,
  //     'numero': numero,
  //     'motDePasse': password,
  //   };
  //   //convert the above data into json
  //   var body = json.encode(data);
  //   print(body);
  //   var response = await http.post(uri, headers: headers, body: body);

  //   //print the response body
  //   print("${response.body}");

  //   return response;
  // }

  // Future<void> saveUserInfo(
  //     String responseJson, String email, String userId) async {
  //   final jsonResponse = json.decode(responseJson);

  //   final userId = jsonResponse['idUser'];
  //   final userEmail = jsonResponse['email'];
  //   final userPassword = jsonResponse['motDePasse'];

  //   final prefs = await SharedPreferences.getInstance();
  //   prefs.setString('idUser', userId.toString());
  //   prefs.setString('email', userEmail);
  //   prefs.setString('motDePasse', userPassword);
  // }

  // Future<UserModel?> loginUser(String email, String password) async {
  //   const apiUrl = 'http://localhost:8080/user/login';

  //   final response = await http.post(
  //     Uri.parse(apiUrl),
  //     body: {
  //       'email': email,
  //       'motDePasse': password,
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     final Map<String, dynamic> userJson = json.decode(response.body);
  //     return UserModel.fromJson(userJson);
  //   } else {
  //     // Identifiants invalides
  //     print('Identifiants invalides');
  //     return null;
  //   }
  // }
}
