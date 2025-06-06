import 'package:_01_mysocialmediaapp/models/user_model.dart';

class Post {
  final String imageUrl;
  final User author;
  final String title;
  final String? location;
  final int likes;
  final int comments;

  Post({
    required this.imageUrl,
    required this.author,
    required this.title,
    this.location,
    this.likes = 0,
    this.comments = 0,
  });
}
