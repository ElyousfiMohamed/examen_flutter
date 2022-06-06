import 'package:examen_flutter/Bloc/Livre/LivreBloc.dart';
import 'package:examen_flutter/Bloc/Livre/LivreEvent.dart';
import 'package:examen_flutter/Bloc/Livre/LivreState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/RequestState.dart';

class LivrePage extends StatelessWidget {
  LivrePage({Key? key}) : super(key: key);
  TextEditingController textEditingController = new TextEditingController();
  LivreEvent? livreEvent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Livres'),
        ),
        body: Column(
          children: [
            Row(children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(15, 15, 0, 0),
                  child: TextField(
                    controller: textEditingController,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Colors.green.shade400)),
                      hintText: "Search",
                    ),
                    onChanged: (String value) async {
                      context.read<LivreBloc>().add(
                          GetLivresByKeywordEvent(textEditingController.text));
                    },
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  livreEvent = GetLivresByKeywordEvent(textEditingController.text);
                  context
                      .read<LivreBloc>()
                      .add(livreEvent!);
                },
              ),
            ]),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: BlocBuilder<LivreBloc, LivreState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.Loaded) {
                    return ListView.builder(
                      itemCount: state.livres.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundColor: Colors.lightGreen,
                              child: Text(
                                  state.livres[index].titre.substring(0, 1)),
                              foregroundColor: Colors.white),
                          title: Column(
                              children: [
                                Text("Livre ${(index+1).toString()} : "+state.livres[index].titre),
                                const Divider(
                                  height: 20,
                                  thickness: 2,
                                  color: Colors.lightGreen,
                                )
                              ],
                          ),
                          subtitle: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(children: [
                                  Text(state.livres[index].isbn),
                                ]),
                                Row(children: [
                                  Text("Titre : " + state.livres[index].titre),
                                ]),
                                Row(children: [
                                  Text(
                                      "Auteur : " + state.livres[index].auteur),
                                  Text(" | Prix : " +
                                      state.livres[index].prix.toString()),
                                ]),
                                Row(children: [
                                  Text("Nombre exemplaires : " +
                                      state.livres[index].nb_exemplaires
                                          .toString()),
                                ]),
                                Row(
                                  children: [
                                    Text("Année de publication : " +
                                        state.livres[index].annee_publication
                                            .year
                                            .toString()),
                                  ],
                                ),
                                const Divider(
                                  height: 20,
                                  thickness: 2,
                                  color: Colors.lightGreen,
                                ),SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            color: Colors.red,
                            onPressed: () {
                              context.read<LivreBloc>().add(
                                  DeleteLivreEvent(state.livres[index].id));
                            },
                          ),
                        );
                      },
                    );
                  } else if (state.requestState == RequestState.Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.requestState == RequestState.Error) {
                    print(state.requestState);
                    return Padding(
                      padding: const EdgeInsets.all(90.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                state.errorMessage.split(":")[1],
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                    color: Colors.red),
                              ),
                              Image.asset('images/error.jpg'),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<LivreBloc>().add(livreEvent!);
                                }, child:const Text("refresh",style: TextStyle(color: Colors.white),),
                                style: ElevatedButton.styleFrom(elevation: 0,primary: Colors.redAccent),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    livreEvent = GetAllLivresEvent();
                    context.read<LivreBloc>().add(livreEvent!);
                    return Center();
                  }
                },
              ),
            )
          ],
        ));
  }
}
