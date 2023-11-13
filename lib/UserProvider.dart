import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  UserModel? get user => _user;

  void setUser(UserModel user) {
    _user = user;
    notifyListeners();
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
