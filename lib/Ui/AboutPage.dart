import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class AboutPage extends StatefulWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          elevation: 0,
          centerTitle: true,),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,45,0,0),
            child: Column (
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("images/02-min.png"),
                  radius: 50,
                ),
                SizedBox(height: 10),
                const Text("Bibliothéque publique BPI"),
                const Divider(
                  height: 30,
                  thickness: 2,
                  indent: 20,
                  endIndent: 20,
                  color: Colors.lightGreen,
                ),
                Padding(
                  padding: EdgeInsets.all(25.0),
                  child: Container(
                    child: const Text("Bibliothèque de lecture publique, la Bpi s’adresse à toute personne en "
                        "recherche d’information ou en formation, que ce soit par motivation personnelle, "
                        "professionnelle, scolaire ou universitaire.\n\nElle propose notamment des espaces de "
                        "lecture et de travail, des collections encyclopédiques sur tous supports en consultation "
                        "sur place, des activités culturelles organisées à l’intérieur du Centre Pompidou…"
                        "\n\nLa Bibliothèque ne propose pas de prêt ni d’espace ou de collection dédiée aux enfants",
                      textAlign: TextAlign.justify,),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
