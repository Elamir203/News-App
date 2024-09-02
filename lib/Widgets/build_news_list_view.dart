import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Services/news_services.dart';
import 'package:news_app/Widgets/news_list_view.dart';
import '../Classes/news_article.dart';

class NewsListViewBuilder extends StatefulWidget {
  NewsListViewBuilder({super.key, required this.whichCategory});
  final String whichCategory;

  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  var futureRequest;
  @override
  void initState() {
    super.initState();
    futureRequest = NewsServices(Dio())
        .getHeadLineNews(whichCategory: widget.whichCategory);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NewsArticle>>(
      future: futureRequest,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          return NewsListView(articles: snapshot.data!);
        } else if (snapshot.hasError) {
          return const Center(
            child: Text(
              'Opps there is an error , try later',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        } else {
          return const SliverFillRemaining(
            hasScrollBody: false,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          );
        }
      },
    );
  }
}
// List<NewsArticle> articles = [];
// bool isNewsLoaded = false;

// i made it of type sliver so i can put it inside the CustomScrollView

// return isNewsLoaded ? articles.isNotEmpty ? NewsListView(articles: articles)  : const SliverToBoxAdapter(
//   child: Center(
//     child: Text('Opps there is an error , try later',style: TextStyle(
//       color: Colors.black,
//       fontSize: 20,
//       fontWeight: FontWeight.bold,
//     ),),
//   ),
// ):  const SliverFillRemaining(
//   hasScrollBody: false,
//   child: Center(
//     child: CircularProgressIndicator(
//       color: Colors.black,
//     ),
//   ),
// );
