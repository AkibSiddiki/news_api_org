// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:news_api_org/componets/blog_tile.dart';
import 'package:news_api_org/helper/news.dart';
import 'package:news_api_org/model/article_model.dart';
import 'package:news_api_org/views/category_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var category = [
    "General",
    "Sports",
    "Entertainment",
    "Technology",
    "Science",
    "Business",
    "Health",
  ];
  List<ArticleModel> articles = <ArticleModel>[];
  bool loading_ = true;

  @override
  void initState() {
    loading_ = true;
    super.initState();
    getNews();
    setState(() {
      loading_ = false;
    });
  }

  getNews() async {
    News newsObj = News();
    await newsObj.getNews();
    setState(() {
      articles = newsObj.news;
    });
  }

  @override
  Widget build(BuildContext context) {
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
        elevation: 2.0,
      ),
      body: loading_
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 62,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CategoryView(catName: category[index],)),
                                );
                              },
                              child: Container(
                                padding: const EdgeInsets.fromLTRB(
                                    12.0, 5.0, 12.0, 5.0),
                                margin: const EdgeInsets.fromLTRB(
                                    12.0, 12.0, 0.0, 12),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue[50],
                                    borderRadius: BorderRadius.circular(8.0)),
                                child: Text(
                                  category[index],
                                  style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'BreeSerif',
                                      color: Colors.black87),
                                ),
                              ),
                            );
                          }),
                    ),
                    Container(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(data: articles[index]);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}