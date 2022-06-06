import 'package:flutter/material.dart';

import '../Widgets/app_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: appDrawer(),
        appBar: AppBar(
          elevation: 0,
          title: const Text(
            "Home",
            style: TextStyle(letterSpacing: 3, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
              color: Colors.white,),
            Container(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, right: 16.0, top: 16.0, bottom: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          child: Center(
                              child: Column(
                                children: [
                                  Container(
                                      width: MediaQuery.of(context).size.width / 1.5,
                                      child: FittedBox(
                                          fit: BoxFit.contain,
                                          child: Text("Title",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w600)))),
                                  Container(
                                      width: MediaQuery.of(context).size.width / 1.5,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text.rich(TextSpan(
                                            text: "SubTitle",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 67,
                                                fontWeight: FontWeight.w600),
                                            children: <InlineSpan>[
                                              WidgetSpan(
                                                  child: Container(
                                                      padding: EdgeInsets.all(2.0),
                                                      margin: EdgeInsets.fromLTRB(
                                                          16.0, 0.0, 0, 50.0),
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(4.0),
                                                          color: Colors.lightGreen),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(
                                                            top: 0,
                                                            bottom: 0,
                                                            left: 4,
                                                            right: 4),
                                                        child: Text("BDCC",
                                                            style: TextStyle(
                                                              color: Colors.white,
                                                              fontWeight: FontWeight.w600,
                                                              fontSize: 19,
                                                            )),
                                                      ))),
                                            ])),
                                      ))
                                ],
                              ))),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Text(
                              "description description description description description description description description",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900)),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: FlatButton(
                              textColor: Colors.white,
                              color: Colors.lightGreen,
                              onPressed: () {
                                Navigator.pushNamed(context, "/about");
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4.0),
                              ),
                              child: Padding(
                                  padding: EdgeInsets.only(
                                      left: 16.0,
                                      right: 16.0,
                                      top: 12,
                                      bottom: 12),
                                  child: Text("COMMENCER",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16.0))),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
