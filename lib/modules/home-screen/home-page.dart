import 'package:flutter/material.dart';
import 'package:flutter_news_api_integration/modules/home-screen/controller.dart';
import 'package:flutter_news_api_integration/modules/home-screen/home-scree.dart';
import 'package:flutter_news_api_integration/modules/home-screen/local-widgets/drawer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final Controller controller = Get.put(Controller());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          DrawerWidget(),
          HomeScreen(),
        ],
      ),
    );
  }
}
