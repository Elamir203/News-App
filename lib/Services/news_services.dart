//dio package transfers the response(string) coming from your request to json data
//by it self while http package make you change the data to json data by your self
//the json data make you easily identify,read the data and use it
import 'package:dio/dio.dart';
import 'package:news_app/Classes/news_article.dart';

class NewsServices {
  final Dio dio;
  NewsServices(this.dio);

  //of type future as it is async function
  Future<List<NewsArticle>> getHeadLineNews(
      {required String whichCategory}) async {
    try {
      Response response = await dio.get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=5ec853c71eda45099f40b81d2f92b05b&category=$whichCategory');
      //i made it map as i see the json data returned as map and the key as string
      //but the data may be int or string or any thing so put it dynamic
      Map<String, dynamic> jsonData = response.data;
      List<dynamic> articles = jsonData['articles'];
      //here dealing with list of maps is very hard so you should
      // change it to list of objects as it more easier to deal with
      /*for(var article in articles){
      print(article);
    }*/
      List<NewsArticle> articlesList = [];
      for (var article in articles) {
        NewsArticle newsArticle = NewsArticle.fromJson(article);
        if (newsArticle.title != '[Removed]') {
          articlesList.add(newsArticle);
        }
      }
      return articlesList;
    } on Exception catch (e) {
      return [];
    }
  }
}
