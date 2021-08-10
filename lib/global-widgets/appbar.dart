import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_api_integration/data/countries.dart';
import 'package:flutter_news_api_integration/modules/home-screen/controller.dart';
import 'package:get/get.dart';

class GlobalAppBar extends StatefulWidget implements PreferredSizeWidget {
  final void Function()? onTitleTap;
  final void Function()? onLeadingTap;
  final IconData? leadingIcon;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  GlobalAppBar({this.onTitleTap, this.onLeadingTap, this.leadingIcon});

  @override
  _GlobalAppBarState createState() => _GlobalAppBarState();
}

class _GlobalAppBarState extends State<GlobalAppBar> {
  Controller controller = Get.put(Controller());

  Country value = Country(54, "🇺🇸", 'us');

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.blue,
      elevation: 0,
      leading: GestureDetector(
        onTap: widget.onLeadingTap,
        child: Icon(widget.leadingIcon),
      ),
      centerTitle: true,
      title: GestureDetector(
        onTap: widget.onTitleTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Flutter News ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
              color: Colors.white,
              child: Text(
                "API",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
      actions: [
        DropdownButton(
          onChanged: (Country? newValue) {
            setState(() {
              print(newValue!.countryCode);
              this.value = newValue;
              controller.fetchNews(country: newValue.countryCode);
            });
          },
          underline: SizedBox(),
          icon: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(this.value.flag),
          ),
          items:
              Country.countriesList().map<DropdownMenuItem<Country>>((country) {
            return DropdownMenuItem(
              value: country,
              child: Text("${country.flag}"),
            );
          }).toList(),
        ),
      ],
    );
  }
}
