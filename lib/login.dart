import 'package:blog_application/myHomePageWidget.dart';
import 'package:flutter/material.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
        ),
        body: Body());
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // FirebaseUser user; // 5

  // String name = ""; // 4
  // TextEditingController controller = new TextEditingController(); // 4

  void click() {
    // this.name = controller.text; // 4
    signInWithGoogle().then((user) => {
          // this.user = user, // 5
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(user.displayName)))
        });
  }

  Widget googleLoginButton() {
    // ignore: deprecated_member_use
    return OutlineButton(
      onPressed: this.click,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
      splashColor: Colors.grey,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(image: AssetImage('assets/google_logo.png'), height: 35),
              Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Sign In with Google',
                      style: TextStyle(color: Colors.grey, fontSize: 25))),
            ],
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        // child: Padding( // 4
        //   padding: EdgeInsets.all(10),
        //   child: TextField(
        //     controller: this.controller,
        //     decoration: InputDecoration(
        //         prefixIcon: Icon(Icons.person),
        //         labelText: "Type Your Name",
        //         border: OutlineInputBorder(
        //             borderSide: BorderSide(width: 5, color: Colors.black)),
        //         suffixIcon: IconButton(
        //           icon: Icon(Icons.done),
        //           splashColor: Colors.blue,
        //           tooltip: "Submit",
        //           onPressed: this.click,
        //         )),
        //   ),
        // )
        child: googleLoginButton());
  }
}
