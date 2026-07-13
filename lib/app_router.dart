import 'package:flutter/material.dart';
import 'package:flutter_bloc_course/constants/strings.dart';
import 'package:flutter_bloc_course/presentation/screens/character_details.dart';
import 'package:flutter_bloc_course/presentation/screens/characters_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreenRoute:
        return MaterialPageRoute(builder: (_) => CharactersScreen());

      case characterDetailsScreenRoute:
        return MaterialPageRoute(builder: (_) => CharacterDetailsScreen());
    }
    return null;
  }
}
