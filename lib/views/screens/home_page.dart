import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/helpers/news_api.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/views/components/customListTile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService client = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
      ),
      body: FutureBuilder(
        future: client.getArticle(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Error: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Article> data = snapshot.data;

            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) =>
                  customListTile(data[index], context),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}