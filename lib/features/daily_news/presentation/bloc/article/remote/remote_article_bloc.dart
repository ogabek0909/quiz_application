import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quiz_application/core/resources/data_state.dart';
import 'package:quiz_application/features/daily_news/domain/usecases/get_article.dart';
import 'package:quiz_application/features/daily_news/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:quiz_application/features/daily_news/presentation/bloc/article/remote/remote_article_state.dart';

class RemoteArticlesBloc extends Bloc<RemoteArticlesEvent, RemoteArticleState> {
  final GetNewsArticleUseCase _getNewsArticleUseCase;
  RemoteArticlesBloc(this._getNewsArticleUseCase)
      : super(const RemoteArticlesLoading()) {
    on<GetArticles>(onGetArticles);
  }

  void onGetArticles(
      GetArticles event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getNewsArticleUseCase();
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RemoteArticlesDone(articles: dataState.data));
    }
    if(dataState is DataFailed ){
      emit(RemoteArticlesError(exception: dataState.dioException));
    }
  }
}
