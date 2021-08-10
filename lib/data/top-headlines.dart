import 'package:flutter/foundation.dart';
import 'package:flutter_news_api_integration/Models/news-article.dart';
import 'package:flutter_news_api_integration/Services/networkHelper.dart';

Future<List<NewsArticleModel>> fetchHeadlines(
    {String? query, String? category, String? country}) async {
  NetworkHelper networkHelper = NetworkHelper(
    url:
        "https://newsapi.org/v2/top-headlines?country=${country != null ? country : "us"}&category=${category != null ? category : ""}&q=${query != null ? query : ""}",
  );

  var decodedData = await networkHelper.getData();

  return compute(parseArticles, decodedData["articles"]);
}

List<NewsArticleModel> parseArticles(dynamic decodedData) {
  List<NewsArticleModel> articles = [];

  for (var object in decodedData) {
    NewsArticleModel article = NewsArticleModel.fromJson(object);

    articles.add(article);
  }

  return articles;
}
