import 'package:flutter/material.dart';
import 'package:news_app/Pages/webview_page.dart';

import '../Classes/news_article.dart';

class NewsContainer extends StatelessWidget {
  const NewsContainer({super.key, required this.newsArticle});

  final NewsArticle newsArticle;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return WebViewPage(
                    url: newsArticle.url,
                  );
                },
              ),
            );
          },
          child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: newsArticle.image != null
                  ? Image.network(
                      newsArticle.image!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/nullImages.jpg')),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          newsArticle.title!,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          newsArticle.subTitle ?? '',
          maxLines: 2,
          style: const TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
