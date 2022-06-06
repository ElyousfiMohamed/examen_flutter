import '../../Model/Livre.dart';
import '../../Model/RequestState.dart';

class LivreState {

  List<Livre> livres = [];
  RequestState requestState;
  String errorMessage;

  LivreState({ required this.livres, required this.requestState, required this.errorMessage});

}

class LivreInitialState extends LivreState {

  LivreInitialState() : super(livres: [], errorMessage: "", requestState: RequestState.None);

}