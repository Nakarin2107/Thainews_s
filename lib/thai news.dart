// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:hunter/darwer.dart';
import 'package:hunter/news.dart';

class ThaiNews extends StatefulWidget {
  const ThaiNews({Key? key}) : super(key: key);

  @override
  State<ThaiNews> createState() => _HomePageState();
}

class _HomePageState extends State<ThaiNews> {
  late Future<List<NewsThailand>> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  List<NewsThailand> newsList = [];
  Future<List<NewsThailand>> fetchNews() async {
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=th&category=business&apiKey=065232174f1d4ea3ac404f81e071a7d2'));
    if (response.statusCode == 200) {
      var responseJson = json.decode(response.body);
      List<dynamic> articles = responseJson['articles'];
      newsList = articles.map((m) => NewsThailand.fromJson(m)).toList();
      return newsList;
    } else {
      throw Exception('Failed to load news');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Text('Thailand News'),
      ),
      drawer: MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder(
          future: futureNews,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('Error loading news: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index) {
                  return _buildNewsCard(snapshot.data![index]);
                },
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildNewsCard(NewsThailand news) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              news.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Text(
              'ผู้เขียน ${news.author}',
              style: TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 36),
            Container(
              alignment: Alignment.center,
              child: Text(
                news.url,
                style: TextStyle(
                  fontSize: 15,
                  color: Color.fromARGB(255, 176, 5, 5),
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              width: double.infinity,
              height: 100,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 243, 238, 238)),
            ),
          ],
        ),
      ),
    );
  }
}
