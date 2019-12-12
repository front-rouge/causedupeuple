import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:causedupeuple/models/article_model.dart';
import 'package:http/http.dart' show Client;
import 'package:rxdart/rxdart.dart';
import './bloc.dart';

class ArticleBloc extends Bloc<ArticleEvent, ArticleState> {
  final Client client;

  ArticleBloc({this.client});

  @override
  Stream<ArticleState> transformEvents(
    Stream<ArticleEvent> events,
    Stream<ArticleState> Function(ArticleEvent event) next,
  ) {
    return super.transformEvents(
      (events as Observable<ArticleEvent>).debounceTime(
        Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  ArticleState get initialState => InitialArticleState();

  @override
  Stream<ArticleState> mapEventToState(ArticleEvent event) async* {
    final currentState = state;
    if (event is ArticleFetch && !_hasReachedMax(currentState)) {
      try {
        if (currentState is InitialArticleState) {
          final articles = await _fetchPosts(0);
          yield ArticleLoaded(articles: articles, hasReachedMax: false);
        }
        if (currentState is ArticleLoaded) {
          final articles = await _fetchPosts(currentState.articles.length);
          yield articles.isEmpty ? currentState.copyWith(hasReachedMax: true) : ArticleLoaded(
            articles: currentState.articles + articles, hasReachedMax: false
          );
        }
      } catch (e) {
        print(e);
        yield ArticleError();
      }
    }
  }

  bool _hasReachedMax(ArticleState state) =>
      state is ArticleLoaded && state.hasReachedMax;

  Future<List<ArticleModel>> _fetchPosts(int startIndex) async {
    final response = await client.get(
        'https://www.causedupeuple.info/wp-json/wp/v2/posts?_embed&page=${(startIndex/10).round()+1}');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((rawPost) {
        return ArticleModel.fromJson(rawPost);
      }).toList();
    } else if (response.statusCode == 400) {
      return [];
    } else {
      throw Exception('error fetching posts');
    }
  }
}
