// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_course/data/models/quotes.dart';
import 'package:meta/meta.dart';

import 'package:flutter_bloc_course/data/repository/quotes_repository.dart';

part 'quotes_state.dart';

class QuotesCubit extends Cubit<QuotesState> {
  final QuotesRepository quotesRepository;
  List<Quote> quotes = [];
  QuotesCubit(this.quotesRepository) : super(QuotesInitial());
  List<dynamic> emitQoutes() {
    quotesRepository.getAllQuotes().then((quotes) {
      emit(QuotesLoaded(quotes: quotes));
      this.quotes = quotes;
    });
    return quotes;
  }
}
