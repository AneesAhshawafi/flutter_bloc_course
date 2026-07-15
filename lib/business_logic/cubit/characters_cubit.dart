// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_course/data/models/characters.dart';
import 'package:flutter_bloc_course/data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepository charactersRepository;
  List<Character> characters = [];
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepository.getAllCharacters().then((characters) {
      emit(CharactersLoaded(characters: characters));
      this.characters = characters;
    });
    return characters;
  }
}
