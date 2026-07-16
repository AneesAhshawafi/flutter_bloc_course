// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc_course/data/models/quotes.dart';
import 'package:flutter_bloc_course/data/web_services/quotes_web_service.dart';

class QuotesRepository {
  late final QuotesWebService quotesWebService;
  QuotesRepository({required this.quotesWebService});
  Future<List<Quote>> getAllQuotes() async {
    final quotes = await quotesWebService.getAllQoutes();

    return quotes.map((quote) => Quote.fromJson(quote)).toList();
  }
}
