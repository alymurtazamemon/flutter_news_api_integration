import 'package:get/get.dart';
import 'package:flutter_news_api_integration/Data/top-headlines.dart'
    as headlines;
import 'package:flutter_news_api_integration/Models/news-article.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';

class Controller extends GetxController {
  late Future<List<NewsArticleModel>> futureArticles;

  @override
  void onInit() {
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    futureArticles = headlines.fetchHeadlines();
    super.onInit();
  }

  void fetchNews({
    String? country,
    String? category,
    String? query,
  }) {
    futureArticles = headlines.fetchHeadlines(
      query: query,
      category: category,
      country: country,
    );
    update();
  }

  // transition properties for main screen transition when drawer button will be pressed.
  var offsetX = 0.0.obs;
  var offsetY = 0.0.obs;
  var scaleFactor = 1.0.obs;
  var isDrawerOpened = false.obs;

  void openDrawer() {
    this.offsetX = 220.0.obs;
    this.offsetY = 40.0.obs;
    this.scaleFactor = 0.88.obs;
    this.isDrawerOpened = true.obs;
    update();
  }

  void closeDrawer() {
    this.offsetX = 0.0.obs;
    this.offsetY = 0.0.obs;
    this.scaleFactor = 1.0.obs;
    this.isDrawerOpened = false.obs;
    update();
  }
}
