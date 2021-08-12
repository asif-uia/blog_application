import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();
  // String text = ""; //2

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  // void changeText(text) {
  //   // If text is hello world this clears the textfield and the state variable
  //   // if (text == "hello world") {
  //   //   controller.clear();
  //   //   text = "";
  //   // }

  //   setState(() {
  //     this.text = text;
  //   });
  // } //2

  @override
  Widget build(BuildContext context) {
    // return Column(children: <Widget>[
    //   TextField(
    //     controller: this.controller,
    //     decoration: InputDecoration(
    //         prefixIcon: Icon(Icons.message), labelText: "Type a message.."),
    //     // onChanged: (text) => this.changeText(text), //2
    //   ),
    //   // Text(this.text) /2
    // ]); //2

    return TextField(
      controller: this.controller,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.message),
          labelText: "Type a message..",
          suffixIcon: IconButton(
            icon: Icon(Icons.send),
            splashColor: Colors.blue,
            tooltip: "Post a message",
            onPressed: this.click,
          )),

      // onChanged: (text) => this.changeText(text), //2
    );
    // Text(this.text) /2
  }
}
