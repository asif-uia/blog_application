import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Post {
  String author;
  String body;
  // int likes = 0; // 6
  Set userLiked = {};
  // bool userLiked = false; // 6
  late DatabaseReference _id;

  Post(this.body, this.author);

  void likePost(FirebaseUser user) {
    // this.userLiked = !this.userLiked; // 6
    // if (this.userLiked)
    //   this.likes += 1;
    // else
    //   this.likes -= 1;
    if (this.userLiked.contains(user.uid)) {
      this.userLiked.remove(user.uid);
    } else {
      this.userLiked.add(user.uid);
    }
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'userLiked': this.userLiked,
      'body': this.body
    };
  }
}
