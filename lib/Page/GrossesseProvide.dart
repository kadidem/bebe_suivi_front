import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:flutter/material.dart';

class GrossesseProvider extends ChangeNotifier {
  List<GrossesseModel> _listeGrossesses = [];
  GrossesseService _grossesseService =
      GrossesseService(); // Instantiate your service
  GrossesseModel? _grossesseEnCours;
  List<GrossesseModel> get listeGrossesses => _listeGrossesses;
  set listeGrossesses(List<GrossesseModel> value) => _listeGrossesses = value;

  // Add a method to fetch grossesses asynchronously
  Future<List<GrossesseModel>> fetchGrossesses() async {
    try {
      _listeGrossesses = await _grossesseService.getAllGrossesse();
      //  notifyListeners();
      return _listeGrossesses;
    } catch (error) {
      // Handle error, e.g., log it or show an error message
      print('Error fetching grossesses: $error');
      return [];
    }
  }

  void setListeGrossesses(List<GrossesseModel> grossesses) {
    _listeGrossesses = grossesses;
    notifyListeners();
  }

  GrossesseModel? get grossesseEnCours => _grossesseEnCours;

  // Setter for currentPregnancy
  set grossesseEnCours(GrossesseModel? value) {
    _grossesseEnCours = value;
    notifyListeners();
  }
}
