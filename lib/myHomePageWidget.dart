import 'package:blog_application/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'post.dart';
import 'textInputWidget.dart';
import 'postList.dart';

// Initializing stateful widget for homepage //3 //4
class MyHomePage extends StatefulWidget {
  // final String name; //6
  final FirebaseUser user;

  // MyHomePage(this.name);//6
  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // String text = ""; //3

  List<Post> posts = [];

  // void changeText(String text) {
  //   this.setState(() {
  //     this.text = text;
  //   });
  // } //3

  void newPost(String text) {
    var post = new Post(text, widget.user.displayName);
    post.setId(savePost(post));
    this.setState(() {
      // posts.add(new Post(text, widget.name)); // 6
      posts.add(post);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        // body: Column(
        //   children: <Widget>[TextInputWidget(this.changeText), Text(this.text)],
        // )); //3

        body: Column(
          children: <Widget>[
            Expanded(child: PostList(this.posts, widget.user)),
            TextInputWidget(this.newPost)
          ],
        ));
  }
}

//2
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Hello World'),
//         ),
//         body: TextInputWidget());
//   }
// } 