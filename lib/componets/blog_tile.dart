import 'package:flutter/material.dart';
import 'package:news_api_org/model/article_model.dart';
import 'package:news_api_org/views/article_view.dart';

// ignore: must_be_immutable
class BlogTile extends StatelessWidget {
  ArticleModel data =
      ArticleModel(content: '', desc: '', imgUrl: '', title: '');

  BlogTile({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ArticleView(),
              settings: RouteSettings(
                arguments: data,
              ),
            ));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(12.0, 12, 12.0, 0),
        child: Column(
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(data.imgUrl)),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                data.title,
                style: const TextStyle(
                    fontFamily: 'BreeSerif',
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Text(
                data.desc,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const Divider(
              color: Colors.black26,
            ),
          ],
        ),
      ),
    );
  }
}