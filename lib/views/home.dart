import 'package:flutter/material.dart';
import 'package:news_api_org/model/category_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> category = [
      CategoryModel(imageUrl:'https://images.unsplash.com/photo-1553877522-43269d4ea984?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80' , categoryName: 'business'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1541534741688-6078c6bfb5c5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8c3BvcnRzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60' , categoryName: 'sports'),
      CategoryModel(imageUrl: 'https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8aGVhbHRofGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=600&q=60', categoryName: 'health')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NEWSAPI.ORG', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              child: ListView.builder(
                itemCount: category.length,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return CategoryTile(imgUrl: category[index].imageUrl, catName: category[index].categoryName);
                }),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  String imgUrl, catName;
  CategoryTile({Key? key, required this.imgUrl, required this.catName}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:<Widget> [
        Image.network(imgUrl,width: 120, height: 60,)
      ],
    );
  }
}