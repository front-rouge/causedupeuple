import 'package:causedupeuple/models/article_model.dart';
import 'package:equatable/equatable.dart';

abstract class ArticleState extends Equatable {
  const ArticleState();

  @override
  List<Object> get props => [];

  get articles => null;
  get hasReachedMax => null;
}

class InitialArticleState extends ArticleState {}

class ArticleError extends ArticleState {}

class ArticleLoaded extends ArticleState {
  final List<ArticleModel> articles;
  final bool hasReachedMax;

  ArticleLoaded({
    this.articles,
    this.hasReachedMax
  });

  ArticleLoaded copyWith({
    List<ArticleModel> articles,
    bool hasReachedMax
  }) {
    return ArticleLoaded(
      articles: articles ?? this.articles,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax
    );
  }

  @override
  List<Object> get props => [articles, hasReachedMax];
}