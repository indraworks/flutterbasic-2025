class User {
  final String name; //harus diinisialisasi duluy
  final String profileImageUrl;

  //named construtor
  //supaya hindari null maka kita pakai required
  User({required this.name, required this.profileImageUrl});
}
