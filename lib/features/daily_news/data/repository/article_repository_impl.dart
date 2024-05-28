import 'dart:io';

import 'package:dio/dio.dart';
import 'package:quiz_application/core/constants/constants.dart';
import 'package:quiz_application/core/resources/data_state.dart';
import 'package:quiz_application/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:quiz_application/features/daily_news/data/models/article.dart';

import '../../domain/repository/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final NewsApiService _newsApiService;
  ArticleRepositoryImpl(this._newsApiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewsArticles() async {
    try{
    final httpResponse = await _newsApiService.getNewsArticles(
      apiKey: newsAPIKey,
      country: countryQuery,
      category: categoryQuery,
    );
    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(data: httpResponse.data);
    } else {
      return DataFailed(
        dioException: DioException(
          requestOptions: httpResponse.response.requestOptions,
          response: httpResponse.response,
          error: httpResponse.response.statusMessage,
          type: DioExceptionType.badResponse,
        ),
      );
    }
  } on DioException catch(e){
    return DataFailed(dioException: e);
  }
  }
}
