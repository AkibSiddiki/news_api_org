import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var category = ["business", "sports", "health","entertainment","general","science","technology",];

  @override
  Widget build(BuildContext context) {
    print(category);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NEWSAPI.ORG',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          children: <Widget>[
            // ignore: avoid_unnecessary_containers
            SizedBox(
              height: 60,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: category.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.fromLTRB(15.0, 8.0,15.0,8.0),
                      margin: const EdgeInsets.all(6.0),
                      decoration: BoxDecoration(color: Colors.red[600], borderRadius: BorderRadius.circular(8.0)),
                      child: GestureDetector(
                        onTap: (){},
                        child: Text(
                          category[index],
                          style: const TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w500,fontFamily: 'BreeSerif',color: Colors.white),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
