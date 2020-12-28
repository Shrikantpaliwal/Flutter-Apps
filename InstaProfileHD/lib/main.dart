import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

String url = "https://www.instagram.com/";
String _imgurl, _username;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<void> getProfileData(String username) async {
    var res = await http.get(Uri.encodeFull(url + username + "/?__a=1"));
    var data = json.decode(res.body);
    var graphql = data['graphql'];
    var user = graphql['user'];
    _imgurl = user['profile_pic_url_hd'];
    setState(() {
      _username = username;
    });
  }

  BuildContext ctx;

  @override
  Widget build(BuildContext context) {
    ctx = context;
    return initialWidget();
  }

  Widget initialWidget() {
    return MaterialApp(
      title: 'InstaProfileHD',
      theme: ThemeData(
        brightness: Brightness.light,
        /* light theme settings */
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        /* dark theme settings */
      ),
      themeMode: ThemeMode.dark,
      /* ThemeMode.system to follow system theme, 
         ThemeMode.light for light theme, 
         ThemeMode.dark for dark theme
      */
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("InstaProfileHD"),
          brightness: Brightness.light,
        ),
        body: mainAct(),
      ),
    );
  }

  Widget mainAct() {
    TextEditingController enteredUsername;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Input Box"),
            TextField(
              controller: enteredUsername,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Enter an instagram username [skip @]'),
            ),
            Container(
              child: RaisedButton(
                elevation: 0,
                textColor: Colors.white,
                padding: EdgeInsets.all(0.0),
                child: Container(
                  color: Colors.lightBlue.withOpacity(0.7),
                  height: 45,
                  width: double.infinity,
                  child: Container(
                    child: Center(
                      child: Text(
                        "Get Image",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                  ),
                ),
                onPressed: () {
                  if (enteredUsername.text.toString() != null)
                    getProfileData(enteredUsername.text.toString());
                },
              ),
            ),
            SizedBox(
              height: MediaQuery.of(ctx).size.height * 0.2,
            ),
            _imgurl != null
                ? Center(
                    child: InteractiveViewer(
                      panEnabled: false, // Set it to false
                      boundaryMargin: EdgeInsets.all(100),
                      minScale: 0.5,
                      maxScale: 2,
                      child: Image.network(
                        _imgurl,
                        width: MediaQuery.of(ctx).size.width * 0.5,
                        height: MediaQuery.of(ctx).size.width * 0.5,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )
                : Center(
                    child: Image.network(
                    "https://wpklik.com/wp-content/uploads/2019/03/A-404-Page-Best-Practices-and-Design-Inspiration.jpg",
                    width: MediaQuery.of(ctx).size.width * 0.5,
                    height: MediaQuery.of(ctx).size.width * 0.5,
                    fit: BoxFit.cover,
                  ))
          ],
        ),
      ),
    );
  }
}
