class NewsArticle {
  final String? image;
  final String? title;
  final String? subTitle;
  final String url;

  NewsArticle(
      {required this.image, required this.title, required this.subTitle , required this.url});

  factory NewsArticle.fromJson(json){
    return NewsArticle(
        image: json['urlToImage'],
        title: json['title'],
        subTitle: json['description'],
        url: json['url']);
  }
}