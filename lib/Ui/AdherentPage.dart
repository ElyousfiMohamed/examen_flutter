import 'package:examen_flutter/Bloc/Adherent/AdherentBloc.dart';
import 'package:examen_flutter/Bloc/Adherent/AdherentEvent.dart';
import 'package:examen_flutter/Bloc/Adherent/AdherentState.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Model/RequestState.dart';

class AdherentPage extends StatelessWidget {
  const AdherentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Adherents"),
        ),
        body: Column(
          children: [
            Expanded(
              child: BlocBuilder<AdherentBloc, AdherentState>(
                builder: (context, state) {
                  if (state.requestState == RequestState.Loaded) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),
                      child: ListView.builder(
                        itemCount: state.adherents.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: CircleAvatar(
                                backgroundColor: Colors.lightGreen,
                                child: Text(state.adherents[index].nom
                                    .substring(0, 1)
                                    .toUpperCase()),
                                foregroundColor: Colors.white),
                            title: Text(state.adherents[index].nom.toUpperCase() +
                                " " +
                                state.adherents[index].prenom),
                            subtitle: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Row(children: [
                                    Text("Email : " +
                                        state.adherents[index].email),
                                  ]),
                                  Row(children: [
                                    Text("Titre : " + state.adherents[index].tel),
                                  ]),
                                ],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              color: Colors.red,
                              onPressed: () {
                                context.read<AdherentBloc>().add(
                                    DeleteAdherentEvent(
                                        state.adherents[index].id));
                              },
                            ),
                          );
                        },
                      ),
                    );
                  } else if (state.requestState == RequestState.Loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state.requestState == RequestState.Error) {
                    print(state.requestState);
                    return Padding(
                      padding: const EdgeInsets.all(100.0),
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
                              // refresh button
                              ElevatedButton(
                                onPressed: () {
                                  context.read<AdherentBloc>().add(GetAllAdherentsEvent());
                                }, child:const Text("refresh",style: TextStyle(color: Colors.white),),
                                style: ElevatedButton.styleFrom(elevation: 0,primary: Colors.redAccent),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  } else {
                    context.read<AdherentBloc>().add(GetAllAdherentsEvent());
                    return Center();
                  }
                },
              ),
            )
          ],
        ));
  }
}
