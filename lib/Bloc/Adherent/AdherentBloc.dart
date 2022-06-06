import 'package:examen_flutter/Bloc/Adherent/AdherentEvent.dart';
import 'package:examen_flutter/Bloc/Adherent/AdherentState.dart';
import 'package:examen_flutter/Bloc/Livre/LivreState.dart';
import 'package:examen_flutter/Repository/AdherentRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Model/RequestState.dart';

class AdherentBloc extends Bloc<AdherentEvent, AdherentState> {

  AdherentRepository adherentRepository ;

  AdherentBloc( AdherentState adherentState, this.adherentRepository) : super(AdherentInitialState()) {

    on<GetAllAdherentsEvent>((event, emit) async {
      emit( AdherentState(requestState: RequestState.Loading, adherents: [], errorMessage: ""));
      await adherentRepository.allAdherents()
          .then((value) => emit(AdherentState(adherents: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(AdherentState(adherents: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });


    on<DeleteAdherentEvent> ((event, emit) async {
      emit( AdherentState(requestState: RequestState.Loading, adherents: [], errorMessage: ""));
      await adherentRepository.deleteAdherent( event.id )
          .then((value) => emit(AdherentState(adherents: value, requestState: RequestState.Loaded, errorMessage: "")))
          .onError((error, stackTrace) => emit(AdherentState(adherents: [], errorMessage: error.toString(), requestState: RequestState.Error)));
    });

  }
}