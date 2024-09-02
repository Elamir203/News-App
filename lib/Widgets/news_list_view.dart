import 'package:flutter/material.dart';
import '../Classes/news_article.dart';
import 'news_container.dart';

class NewsListView extends StatelessWidget {
  const NewsListView({super.key, required this.articles});
  final List<NewsArticle> articles;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: articles.length,
        (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 22),
            child: NewsContainer(
              newsArticle: articles[index],
            ),
          );
        },
      ),
    );
  }
}
