import 'package:flutter/material.dart';

import 'drawer_item.dart';

class appDrawer extends StatelessWidget {
  const appDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0,30,0,0),
              child: DrawerHeader(child: Column(
                children: const [
                  CircleAvatar(
                    backgroundImage: AssetImage("images/02-min.png"),
                    radius: 40,
                  ),
                  SizedBox(height: 10),
                  Text("Bibliothéque publique"),
                ],
              )),
            ),
            DrawerItem("Home","/",const Icon(Icons.home,color: Colors.lightGreen,)),
            DrawerItem("Livres","/livres",const Icon(Icons.book,color: Colors.lightGreen,)),
            DrawerItem("Adherents","/adherents",const Icon(Icons.person,color: Colors.lightGreen,)),
            DrawerItem("About","/about",const Icon(Icons.error,color: Colors.lightGreen)),
          ],
        ),
      );
  }
}