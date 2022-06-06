import 'package:examen_flutter/Model/Adherent.dart';

import '../../Model/RequestState.dart';

class AdherentState {

  List<Adherent> adherents = [];
  RequestState requestState;
  String errorMessage;

  AdherentState({ required this.adherents, required this.requestState, required this.errorMessage});

}

class AdherentInitialState extends AdherentState {

  AdherentInitialState() : super(adherents: [], errorMessage: "", requestState: RequestState.None);

}
