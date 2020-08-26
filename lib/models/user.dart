class User {
  final String uid;
  final String name;
  final String email;

  User({
    this.email,
    this.uid,
    this.name,
  });
}

class UserData {
  final String uid;
  final String identifier;

  UserData({this.uid, this.identifier});
}
