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
          title: const Text("About me"),
          elevation: 0,
          centerTitle: true,),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,45,0,0),
            child: Column (
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("images/02-min.jpg"),
                  radius: 50,
                ),
                SizedBox(height: 10),
                const Text("Mohamed ELYOUSFI"),
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
                    child: const Text("Actuellement étudiant en deuxième année en Ingénierie Informatique - Big Data & Cloud Computing "
                        "a l'ENSET Mohammedia.Titulaire d'un DUT en Administration Systèmes et Réseaux a l'ESTO (Metion Très Bien) "
                        "en 2020,durant cette formation j'ai effectué quelques stages et expériences professionnelles (stage d'initiation "
                        "a l'Office Cherifien des Phosphates khouribga d'une durée d'un mois et aussi un stage professionnel a l'Ecole Supérieure "
                        "de Technologie oujda),j'ai eu mon baccalauréat par mention bien en Sciences Expérimentales en 2018.",
                      textAlign: TextAlign.justify,),
                  ),
                )
              ],
            ),
          ),
        )
    );
  }
}
