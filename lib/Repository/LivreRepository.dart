import 'dart:math';

import '../Model/Livre.dart';

class LivreRepository {
  List<Livre> livres = [
    Livre(
      id: 1,
      isbn: '256AQSFQLMSF',
      titre : 'De sang-froid ',
      auteur : 'Truman Capote',
      annee_publication : DateTime.now(),
      nb_exemplaires: 55,
      prix: 50
    ), Livre(
        id: 2,
        isbn: '7E875D6213',
        titre : 'Ugly Love',
        auteur : 'Colleen',
        annee_publication : DateTime.now(),
        nb_exemplaires: 5,
        prix: 500
    ), Livre(
        id: 3,
        isbn: '5RTOPMSDF5',
        titre : 'Emotionnal intelligence',
        auteur : 'Robert',
        annee_publication : DateTime.now(),
        nb_exemplaires: 15,
        prix: 120
    ),Livre(
        id: 4,
        isbn: '9DFGDSG5SF',
        titre : 'Des fleurs pour Algernon',
        auteur : 'Daniel Keyes',
        annee_publication : DateTime.now(),
        nb_exemplaires: 89,
        prix: 180
    ),Livre(
        id: 5,
        isbn: '5RTOPMSDF5',
        titre : 'Une chambre à soi',
        auteur : 'Virginia Woolf',
        annee_publication : DateTime.now(),
        nb_exemplaires: 15,
        prix: 120
    ),
  ];

  // get all livres
  Future<List<Livre>> getAllLivres() async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    return livres;
  }

  // get livre by keyword  (titre)
  Future<List<Livre>> getLivreByKeyword(String keyword) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    return livres.where((livre) => livre.titre.toLowerCase().contains(keyword.toLowerCase())).toList();
  }

  //delete livre by id
  Future<bool> deleteLivreById(int id) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    livres.removeWhere((livre) => livre.id == id);
    return true;
  }



}
