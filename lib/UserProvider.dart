import 'package:bebe_suivi/Modele/AdminModel.dart';
import 'package:bebe_suivi/Modele/DocteurModel.dart';
import 'package:bebe_suivi/Modele/UserModel.dart';
import 'package:bebe_suivi/Page/Patient/Docteur.dart';
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

class DocteurProvider extends ChangeNotifier {
  DocteurModel? _docteur;

  DocteurModel? get docteur => _docteur;

  void setDocteur(DocteurModel docteur) {
    _docteur = docteur;
    notifyListeners();
  }

  void logout() {
    _docteur = null;
    notifyListeners();
  }
}

class AdminProvider extends ChangeNotifier {
  AdminModel? _admin;

  AdminModel? get admin => _admin;

  void setAdmin(AdminModel admin) {
    _admin = admin;
    notifyListeners();
  }

  void logout() {
    _admin = null;
    notifyListeners();
  }
}
