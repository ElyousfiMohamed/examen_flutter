import 'package:examen_flutter/Bloc/Adherent/AdherentBloc.dart';
import 'package:examen_flutter/Bloc/Adherent/AdherentState.dart';
import 'package:examen_flutter/Bloc/Livre/LivreBloc.dart';
import 'package:examen_flutter/Bloc/Livre/LivreState.dart';
import 'package:examen_flutter/Repository/AdherentRepository.dart';
import 'package:examen_flutter/Repository/LivreRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_flutter/Ui/AboutPage.dart';

import 'Ui/AdherentPage.dart';
import 'Ui/HomePage.dart';
import 'Ui/LivrePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LivreBloc( LivreInitialState(), LivreRepository())),
          BlocProvider(create: (context) => AdherentBloc( AdherentInitialState(), AdherentRepository())),
        ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ' app',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          routes: {
            "/": (context) => HomePage(),
            "/livres": (context) => LivrePage(),
            "/adherents": (context) => AdherentPage(),
            "/about": (context) => AboutPage(),
          },
          initialRoute: "/",
        )
    );
  }
}
