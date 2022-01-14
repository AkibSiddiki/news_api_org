import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_api_org/model/article_model.dart';

class ArticleView extends StatelessWidget {
  const ArticleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as ArticleModel;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'NEWZ',
          style: TextStyle(color: Colors.lightBlue),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.lightBlue,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          CachedNetworkImage(
                imageUrl: article.imgUrl,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    LinearProgressIndicator(value: downloadProgress.progress),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
          const SizedBox(height: 12.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12,0,12,0),
            child: Text(
              article.title,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 24.0,
                fontWeight: FontWeight.w600,
                fontFamily: 'BreeSerif',
              ),
            ),
          ),
          const SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12,0,12,0),
            child: Text(
              article.desc,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'BreeSerif',
              ),
            ),
          ),
          const SizedBox(height: 8.0,),
          Padding(
            padding: const EdgeInsets.fromLTRB(12,0,12,0),
            child: Text(
              article.content,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 18.0,
                fontWeight: FontWeight.w400,
                //fontFamily: 'BreeSerif',
              ),
            ),
          ),
        ],
      ),
    );
  }
}

