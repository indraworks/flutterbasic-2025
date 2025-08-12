//Posts  instance object post-post  dari Post class
import 'package:socio_network_indra/models/post_model.dart';
import 'package:socio_network_indra/models/user_model.dart';

final _post0 = Post(
  imageUrl: 'assets/images/post0.jpg',
  author: User(name: 'orang0'),
  title: 'Post 0',
  location: 'Location 0',
  likes: 100,
  comments: 102,
);
final _post1 = Post(
  imageUrl: 'assets/images/post1.jpg',
  author: User(name: 'orang1'),
  title: 'Post 1',
  location: 'Location 1',
  likes: 201,
  comments: 61,
);
final _post2 = Post(
  imageUrl: 'assets/images/post2.jpg',
  author: User(name: 'orang2'),
  title: 'Post 2',
  location: 'Location 2',
  likes: 301,
  comments: 81,
);
final _post3 = Post(
  imageUrl: 'assets/images/post3.jpg',
  author: User(name: 'orang3'),
  title: 'Post 3',
  location: 'Location 3',
  likes: 401,
  comments: 41,
);
final _post4 = Post(
  imageUrl: 'assets/images/post4.jpg',
  author: User(name: 'orang4'),
  title: 'Post 4',
  location: 'Location 4',
  likes: 104,
  comments: 31,
);
final _post5 = Post(
  imageUrl: 'assets/images/post5.jpg',
  author: User(name: 'orang5'),
  title: 'Post 5',
  location: 'Location 5',
  likes: 105,
  comments: 21,
);

final posts = [_post0, _post1, _post2, _post3, _post4, _post5];
final users = [
  User(name: "user0", profileImageUrl: "assets/images/user0.jpg"),
  User(name: "user1", profileImageUrl: "assets/images/user1.jpg"),
  User(name: "user2", profileImageUrl: "assets/images/user2.jpg"),
  User(name: "user3", profileImageUrl: "assets/images/user3.jpg"),
  User(name: "user4", profileImageUrl: "assets/images/user4.jpg"),
  User(name: "user5", profileImageUrl: "assets/images/user5.jpg"),
];
final _yourPosts = [_post1, _post3, _post5];
final _yourFavorites = [_post0, _post4];

//current users
final User currentUser = User(
  name: "Santoso",
  profileImageUrl: 'assets/images/user.jpg',
  backgroundImageUrl: 'assets/images/user_background.jpg',
  following: 39,
  followers: 114,
  posts: _yourPosts,
  favorites: _yourFavorites,
);
