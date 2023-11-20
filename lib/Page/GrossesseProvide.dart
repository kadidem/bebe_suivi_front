import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:flutter/material.dart';

class GrossesseProvider extends ChangeNotifier {
  List<GrossesseModel> _listeGrossesses = [];

  List<GrossesseModel> get listeGrossesses => _listeGrossesses;

  void setListeGrossesses(List<GrossesseModel> grossesses) {
    _listeGrossesses = grossesses;
    notifyListeners();
  }
}
