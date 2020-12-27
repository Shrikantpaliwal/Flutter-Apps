import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Post> fetchPosts() async {
  final response =
      await http.get('https://shrikantpaliwal.com/wp-json/wp/v2/posts/');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Post.fromJson(jsonDecode(response.body)[0]);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Post {
  final int postId;
  final String link;
  final String title;

  Post({this.postId, this.link, this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      postId: json['id'],
      link: json['link'],
      title: json['slug'],
    );
  }
}

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<Post> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Posts Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Posts Example'),
        ),
        body: Center(
          child: FutureBuilder<Post>(
            future: futurePosts,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return postCard(snapshot);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

class postCard extends StatelessWidget {
  final AsyncSnapshot<Post> snapshot;

  postCard(this.snapshot);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(snapshot.data.title), Text(snapshot.data.link)],
        ),
      ),
    );
  }
}
