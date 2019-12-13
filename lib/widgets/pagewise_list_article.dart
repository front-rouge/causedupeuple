import 'package:causedupeuple/blocs/bloc.dart';
import 'package:causedupeuple/widgets/article_preview_card.dart';
import 'package:causedupeuple/widgets/bottom_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PagewiseListArticle extends StatefulWidget {

  @override
  _PagewiseListArticleState createState() => _PagewiseListArticleState();
}

class _PagewiseListArticleState extends State<PagewiseListArticle> {

  final _scrollController = ScrollController();
  final _scrollThreshold = 200.0;
  ArticleBloc _articleBloc;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _articleBloc = BlocProvider.of<ArticleBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (context, state) {
        if (state is InitialArticleState) {
          return Center(child: CircularProgressIndicator(),);
        }
        if (state is ArticleError) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Une erreur est survenue',
                  style: Theme.of(context).textTheme.title,
                ),
                FlatButton(
                  onPressed: () => _articleBloc.add(ArticleFetch()),
                  child: Text("Rééssayer"),
                  color: Theme.of(context).accentColor,
                )
              ]
            )
          );
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            if (index >= state.articles.length) {
              return BottomLoader();
            }
            return ArticlePreviewCard(article: state.articles[index]);
          },
          itemCount: state.hasReachedMax ? state.articles.length : state.articles.length + 1,
          controller: _scrollController,
        );
      }
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    if (maxScroll - currentScroll <= _scrollThreshold) {
      _articleBloc.add(ArticleFetch());
    }
  }
}