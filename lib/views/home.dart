import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
        
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  String imageUrl, categoryName;
  CategoryTile(this.imageUrl,this.categoryName, {Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children:<Widget> [
          Image.network(imageUrl,width: 120, height: 60,)
        ],
      )
    );
  }
}