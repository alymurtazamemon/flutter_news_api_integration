import 'package:flutter/material.dart';

class NewsArticleWidget extends StatelessWidget {
  final String headline;
  final String? news;
  final String? image;
  final void Function() onTap;

  NewsArticleWidget({
    required this.headline,
    required this.image,
    required this.news,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(image!),
                  )
                : Text("Image Not Found ⚠"),
            SizedBox(height: 16),
            Text(
              headline,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            news != null
                ? Wrap(
                    runSpacing: 4.0,
                    children: [
                      Text(
                        news!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                      ),
                      Text(
                        "readmore",
                        style: TextStyle(
                          color: Colors.blueAccent,
                        ),
                      ),
                    ],
                  )
                : Text(""),
          ],
        ),
      ),
    );
  }
}
