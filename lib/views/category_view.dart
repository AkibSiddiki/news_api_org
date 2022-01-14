// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:news_api_org/componets/blog_tile.dart';
import 'package:news_api_org/helper/news.dart';
import 'package:news_api_org/model/article_model.dart';

// ignore: must_be_immutable
class CategoryView extends StatefulWidget {
   String catName="";
   CategoryView({Key? key, required this.catName}) : super(key: key);

  @override
  _CategoryViewState createState() => _CategoryViewState();
}
class _CategoryViewState extends State<CategoryView> {
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
    super.initState();
    getNews(widget.catName);
    setState(() {
      loading_ = false;
    });
  }

  getNews(String x) async {
    CategoryNews newsObj = CategoryNews();
    await newsObj.getNews(x);
    setState(() {
      articles = newsObj.news;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.catName,
          style: const TextStyle(color: Colors.lightBlue),
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
                                Navigator.pushReplacement(
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
                                    color: Colors.lightBlue[100],
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