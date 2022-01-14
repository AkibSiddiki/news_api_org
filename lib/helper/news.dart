import 'dart:convert';
import 'package:news_api_org/model/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news = [];
  
  Future<void> getNews() async{

    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=d55467a310e84bc0a0b21d78cb3bd91b";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    if(data['status']=="ok"){
      data['articles'].forEach((element){
        if(element['title'] != null && element['description'] != null && element['urlToImage'] !=null && element['content'] != null){
          ArticleModel article = ArticleModel(
              title: element['title'],
              desc: element['description'],
              imgUrl: element['urlToImage'],
              content: element['content'],
          );
          news.add(article);
        }
      });
    }
  }
}
class CategoryNews{
  List<ArticleModel> news = [];
  
  Future<void> getNews(String cat) async{

    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$cat&apiKey=d55467a310e84bc0a0b21d78cb3bd91b";
    var response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body);

    if(data['status']=="ok"){
      data['articles'].forEach((element){
        if(element['title'] != null && element['description'] != null && element['urlToImage'] !=null && element['content'] != null){
          ArticleModel article = ArticleModel(
              title: element['title'],
              desc: element['description'],
              imgUrl: element['urlToImage'],
              content: element['content'],
          );
          news.add(article);
        }
      });
    }
  }
}