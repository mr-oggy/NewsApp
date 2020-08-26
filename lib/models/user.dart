class UserModel {
  final String uid;
  final String name;
  final String email;

  UserModel({
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
