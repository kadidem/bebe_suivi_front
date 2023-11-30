import 'package:bebe_suivi/Modele/GrossesseModele.dart';
import 'package:bebe_suivi/Modele/MedicamentModel.dart';
import 'package:bebe_suivi/Service/GrossesseService.dart';
import 'package:bebe_suivi/Service/MedicamentService.dart';
import 'package:flutter/material.dart';

class MedicamentProvider extends ChangeNotifier {
  List<MedicamentModel> _listeMedicaments = [];
  final MedicamentService _medicamentService =
      MedicamentService(); // Instantiate your service
  //MedicamentModel? _grossesseEnCours;
  List<MedicamentModel> get listeMedicament => _listeMedicaments;
  set listeMedicament(List<MedicamentModel> value) => _listeMedicaments = value;

  // Add a method to fetch grossesses asynchronously
  Future<List<MedicamentModel>> fetchMedicaments() async {
    try {
      _listeMedicaments = await _medicamentService.getAllMedicaments();
      //  notifyListeners();
      return _listeMedicaments;
    } catch (error) {
      // Handle error, e.g., log it or show an error message
      print('Error fetching medicaments: $error');
      return [];
    }
  }

  void setListeGrossesses(List<MedicamentModel> medicaments) {
    _listeMedicaments = medicaments;
    notifyListeners();
  }
}
