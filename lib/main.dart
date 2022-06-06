import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:examen_flutter/Ui/AboutPage.dart';

import 'Ui/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: const [
          // BlocProvider(create: (context) => ),
        ],

        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: ' app',
          theme: ThemeData(
            primarySwatch: Colors.lightGreen,
          ),
          routes: {
            "/": (context) => HomePage(),
            "/about": (context) => AboutPage(),
          },
          initialRoute: "/",
        )
    );
  }
}
