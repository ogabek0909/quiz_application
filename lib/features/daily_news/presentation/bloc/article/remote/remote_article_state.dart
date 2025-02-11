import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:quiz_application/features/daily_news/domain/entities/article.dart';

abstract class RemoteArticleState extends Equatable{
  final List<ArticleEntity> ? articles;
  final DioException ? exception;

  const RemoteArticleState({this.articles, this.exception});

  @override
  List<Object?> get props => [articles,exception];
}

class  RemoteArticlesLoading extends RemoteArticleState{
  const RemoteArticlesLoading();
}

class RemoteArticlesDone extends RemoteArticleState{
  const RemoteArticlesDone({super.articles});
}

class RemoteArticlesError extends RemoteArticleState{
  const RemoteArticlesError({super.exception});
}