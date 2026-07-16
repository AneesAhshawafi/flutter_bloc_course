import 'package:flutter_bloc_course/constants/strings.dart';
import 'package:dio/dio.dart';

class QuotesWebService {
  late Dio dio;
  QuotesWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrlQuote,
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    );

    dio = Dio(options);
  }

  Future<List<dynamic>> getAllQoutes() async {
    try {
      final response = await dio.get('quotes/5');
      final quotesMap = response.data;
      final List<dynamic> quotesList = quotesMap['results'] ?? [];
      return quotesList;
    } catch (e) {
      return [
        {"quote": "I could have saved her."},
        {"quote": "What good is money that doesn't spend?"},
        {"quote": "One of these days when you come up here, I'll be dead."},
        {"quote": "I'm not in the meth business. I'm in the empire business."},
        {
          "quote":
              "If you don’t know who I am, then maybe your best course would be to tread lightly.",
        },
      ];
    }
  }
}
