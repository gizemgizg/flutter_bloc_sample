
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/models/characters_model.dart';
import '../../repository/services/characters_service.dart';
import '../../screens/character_details_screen.dart';

part 'all_characters_event.dart';
part 'all_characters_state.dart';

class AllCharactersBloc extends Bloc<AllCharactersEvent, AllCharactersState> {
  AllCharactersBloc(
 {
    required this.charactersService,
  }): super( AllCharactersState()){
    on<AllCharactersEvent>((event, emit) => _mapGetCharacterEventToState(event, emit));
  }

  final CharactersService charactersService;

  void _mapGetCharacterEventToState(
      AllCharactersEvent event, Emitter<AllCharactersState> emit) async {
    try {
      emit(state.copyWith(status: AllCharactersStatus.loading));
      final characters = await charactersService.getAllCharacters();
      emit(
        state.copyWith(
          status: AllCharactersStatus.success,
          charactersModel: characters,
        ),
      );
    } catch (error) {
      emit(state.copyWith(status: AllCharactersStatus.error));
    }
  }

 
}
