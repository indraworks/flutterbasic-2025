import 'package:socio_network_dpindra/models/post_model.dart';

class User {
  final String
  profileImageUrl; //default empty string utk image; bisa di type diberi ? tapi recomeneded nilai default
  final String backgroundImageUrl; //default empty string ;
  final String name; //always required
  final int following; //nilai default null
  final int followers; //nilai default null
  final List<Post> posts; //kunci tamu dari model pos //default empty list []
  final List<Post>
  favorites; //kunci tamu dari model post  //default empty list []

  User({
    this.profileImageUrl = '',
    this.backgroundImageUrl = '',
    required this.name,
    this.following = 0,
    this.followers = 0,
    this.posts = const [],
    this.favorites = const [],
  });
}
