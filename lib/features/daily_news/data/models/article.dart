import 'package:quiz_application/features/daily_news/domain/entities/article.dart';

class ArticleModel extends ArticleEntity{
  const ArticleModel({
    int ? id,
    String ? author,
    String ? title, 
    String ? description,
    String ? url,
    String ? urlImage,
    String ? publishedAt,
    String ? content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map){
    return ArticleModel( 
      author: map['author'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      url: map['url'] ?? '',
      urlImage: map['urlImage'] ?? '',
      publishedAt: map['publishedAt'] ?? '',
      content: map['content'] ?? '',
    );
  }
}