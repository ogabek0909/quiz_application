import 'package:quiz_application/core/resources/data_state.dart';
import 'package:quiz_application/core/usecases/usecase.dart';
import 'package:quiz_application/features/daily_news/domain/entities/article.dart';
import 'package:quiz_application/features/daily_news/domain/repository/article_repository.dart';

class GetNewsArticleUseCase implements UseCase<DataState<List<ArticleEntity>>, void>{

  final ArticleRepository _articleRepository;
  GetNewsArticleUseCase(this._articleRepository);
  @override
  Future<DataState<List<ArticleEntity>>> call({void params}) {
    return _articleRepository.getNewsArticles();
     
  }
}