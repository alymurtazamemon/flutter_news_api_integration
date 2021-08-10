import 'package:flutter/material.dart';
import 'package:flutter_news_api_integration/Models/news-article.dart';
import 'package:flutter_news_api_integration/global-widgets/appbar.dart';
import 'package:flutter_news_api_integration/modules/home-screen/controller.dart';
import 'package:flutter_news_api_integration/modules/home-screen/local-widgets/news-articles.dart';
import 'package:flutter_news_api_integration/modules/home-screen/local-widgets/search-field.dart';
import 'package:flutter_news_api_integration/modules/home-screen/local-widgets/web-view.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // variable to handle the change of text field.
  late String query = "";

  // controller for search text field.
  final searchFieldController = TextEditingController();

  // getx controller.
  final Controller controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Controller>(
        dispose: (_) => searchFieldController.dispose(),
        builder: (_) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            transform:
                Matrix4.translationValues(_.offsetX.value, _.offsetY.value, 0)
                  ..scale(_.scaleFactor.value),
            child: GestureDetector(
              onHorizontalDragEnd: (DragEndDetails details) {
                if (controller.isDrawerOpened.value) {
                  controller.closeDrawer();
                }
              },
              child: Scaffold(
                appBar: GlobalAppBar(
                  leadingIcon: Icons.menu,
                  onLeadingTap: () {
                    if (controller.isDrawerOpened.value) {
                      controller.closeDrawer();
                    } else {
                      controller.openDrawer();
                    }
                  },
                  onTitleTap: () {
                    print("title tap");
                    controller.fetchNews();
                    // futureArticles = fetchHeadlines();
                    // setState(() {});
                    searchFieldController.clear();
                    FocusScope.of(context).unfocus();
                  },
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      child: SearchField(
                        controller: searchFieldController,
                        onPressed: () {
                          controller.fetchNews(query: query);
                          // if (query != "") {
                          //   futureArticles = fetchHeadlines(query: query);
                          //   setState(() {});
                          // }
                          FocusScope.of(context).unfocus();
                        },
                        onChanged: (searchTerm) {
                          query = searchTerm;
                        },
                      ),
                    ),
                    FutureBuilder(
                      future: controller.futureArticles,
                      builder: (BuildContext context,
                          AsyncSnapshot<List<NewsArticleModel>> snapshot) {
                        if (snapshot.hasData) {
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data?.length ?? 0,
                              itemBuilder: (context, index) {
                                var object = snapshot.data![index];
                                return NewsArticleWidget(
                                  headline: object.title,
                                  image: object.urlToImage,
                                  news: object.description,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return WebViewWidget(
                                            url: object.url,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          );
                        }

                        return Center(child: CircularProgressIndicator());
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
