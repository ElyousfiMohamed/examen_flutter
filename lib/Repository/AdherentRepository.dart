import 'dart:math';

import 'package:examen_flutter/Model/Adherent.dart';

class AdherentRepository {
  List<Adherent> adherents = [
      Adherent(
        id:1,
        nom:"elyousfi",
        prenom: "mohamed",
        email: "mohamed@contact.me",
        tel : "+212622427363"
      ),Adherent(
        id:2,
        nom:"taifaoui",
        prenom: "abdellah",
        email: "abdellah@contact.me",
        tel : "+212658796289"
    ),Adherent(
        id:3,
        nom:"maqbour",
        prenom: "mohamed",
        email: "maqbour@contact.me",
        tel : "+212625789653"
    ),Adherent(
        id:4,
        nom:"elyousfi",
        prenom: "oussama",
        email: "oussama@contact.me",
        tel : "+212688996655"
    ),
  ];

  Future<List<Adherent>> allAdherents() async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if( rand>8) {
      throw Exception("ERROR !");
    }
    return adherents;
  }

  // delete adherent by id
  Future<List<Adherent>> deleteAdherent(int id) async {
    var future = await Future.delayed(const Duration(seconds: 1));
    int rand = Random().nextInt(10);
    if (rand > 8) {
      throw Exception("ERROR !");
    }
    adherents.removeWhere((element) => element.id == id);
    return adherents;
  }
}