import 'package:flutter/material.dart';
import 'package:flutter_news_api_integration/modules/home-screen/controller.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  // getx controller.
  final Controller c = Get.find<Controller>();

  Widget sections(
      {required IconData icon, required String title, void Function()? onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(left: 36),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget divider(context) {
    return Container(
      width: 170,
      padding: EdgeInsets.only(left: 72, top: 20, bottom: 20),
      child: Divider(color: Colors.white),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "News Categories",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(height: 36),
              sections(
                icon: Icons.business,
                title: "Business",
                onTap: () {
                  c.fetchNews(category: "business");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
              divider(context),
              sections(
                icon: Icons.album,
                title: "Entertainment",
                onTap: () {
                  c.fetchNews(category: "entertainment");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
              divider(context),
              sections(
                icon: Icons.language,
                title: "General",
                onTap: () {
                  c.fetchNews(category: "general");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
              divider(context),
              sections(
                icon: Icons.health_and_safety,
                title: "Health",
                onTap: () {
                  c.fetchNews(category: "health");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
              divider(context),
              sections(
                icon: Icons.science,
                title: "Science",
                onTap: () {
                  c.fetchNews(category: "science");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
              divider(context),
              sections(
                icon: Icons.sports,
                title: "Sports",
                onTap: () {
                  c.fetchNews(category: "sports");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
              divider(context),
              sections(
                icon: Icons.cloud,
                title: "Technology",
                onTap: () {
                  c.fetchNews(category: "technology");
                  if (c.isDrawerOpened.value) {
                    c.closeDrawer();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
