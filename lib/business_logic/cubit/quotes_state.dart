// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'quotes_cubit.dart';

@immutable
sealed class QuotesState {}

final class QuotesInitial extends QuotesState {}

class QuotesLoaded extends QuotesState {
  final List<Quote> quotes;
  QuotesLoaded({required this.quotes});
}
