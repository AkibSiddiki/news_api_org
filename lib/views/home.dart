import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_api_org/helper/news.dart';
import 'package:news_api_org/model/article_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var category = [
    "business",
    "sports",
    "health",
    "entertainment",
    "general",
    "science",
    "technology",
  ];
  List<ArticleModel> articles = <ArticleModel>[];
  bool loading_ = true;

  @override
  void initState() {
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
          'NEWSAPI.ORG',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0, systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: loading_
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 62,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: category.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {},
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
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return BlogTile(
                                newstitle: articles[index].title,
                                imgurl: articles[index].imgUrl,
                                desc: articles[index].desc);
                          }),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String newstitle, imgurl, desc;
  const BlogTile(
      {Key? key,
      required this.newstitle,
      required this.imgurl,
      required this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(imgurl)),
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8,0,8,0),
              child: Text(
                newstitle,
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
              padding: const EdgeInsets.fromLTRB(8,0,8,0),
              child: Text(
                desc,
                maxLines: 3,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 15.0,
                  
                ),
              ),
            ),
            const SizedBox(height: 5.0,)
          ],
        ),
      ),
    );
  }
}
