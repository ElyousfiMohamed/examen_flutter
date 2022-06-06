import 'package:examen_flutter/Bloc/Livre/LivreEvent.dart';
import 'package:examen_flutter/Bloc/Livre/LivreState.dart';
import 'package:examen_flutter/Repository/LivreRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/RequestState.dart';

class LivreBloc extends Bloc<LivreEvent, LivreState> {

  LivreRepository livreRepository ;

  // may need it
  String lastLoad= "";

  LivreBloc( LivreState livreState, this.livreRepository) : super(LivreInitialState()) {

    on<GetAllLivresEvent>((event, emit) async {
      lastLoad = "all";
      emit( LivreState(requestState: RequestState.Loading, livres: [], errorMessage: ""));
      await livreRepository.getAllLivres()
          .then((value) => emit(LivreState(livres: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(LivreState(livres: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

    on<GetLivresByKeywordEvent> ((event, emit) async {
      lastLoad= event.keyword;
      emit( LivreState(requestState: RequestState.Loading, livres: [], errorMessage: ""));
      await livreRepository.getLivresByKeyword( event.keyword )
          .then((value) => emit(LivreState(livres: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(LivreState(livres: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

    on<DeleteLivreEvent> ((event, emit) async {
      emit( LivreState(requestState: RequestState.Loading, livres: [], errorMessage: ""));
      await livreRepository.deleteLivreById( event.id )
          .then((value) => emit(LivreState(livres: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(LivreState(livres: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

  }
}