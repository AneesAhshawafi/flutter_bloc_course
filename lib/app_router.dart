import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_course/business_logic/cubit/characters_cubit.dart';
import 'package:flutter_bloc_course/business_logic/cubit/quotes_cubit.dart';
import 'package:flutter_bloc_course/constants/strings.dart';
import 'package:flutter_bloc_course/data/models/characters.dart';
import 'package:flutter_bloc_course/data/repository/characters_repository.dart';
import 'package:flutter_bloc_course/data/repository/quotes_repository.dart';
import 'package:flutter_bloc_course/data/web_services/characters_web_services.dart';
import 'package:flutter_bloc_course/data/web_services/quotes_web_service.dart';
import 'package:flutter_bloc_course/presentation/screens/character_details_screen.dart';
import 'package:flutter_bloc_course/presentation/screens/characters_screen.dart';

class AppRouter {
  //Characters
  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;
  //Quotes
  late QuotesRepository quotesRepository;
  late QuotesCubit quotesCubit;
  AppRouter() {
    //Characters
    charactersRepository = CharactersRepository(
      charactersWebServices: CharactersWebServices(),
    );
    charactersCubit = CharactersCubit(charactersRepository);
    //Quotes
    quotesRepository = QuotesRepository(quotesWebService: QuotesWebService());
    quotesCubit = QuotesCubit(quotesRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case charactersScreenRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: CharactersScreen(),
          ),
        );

      case characterDetailsScreenRoute:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => quotesCubit,
            child: CharacterDetailsScreen(character: character),
          ),
        );
    }
    return null;
  }
}
