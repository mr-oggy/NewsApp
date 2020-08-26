import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//create user object based on firebasedUser
  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null
        ? User(
            uid: user.uid,
            name: user.displayName,
            email: user.email,
          )
        : null;
  }

//auth change user streem

  Stream<User> get user {
    return _auth.onAuthStateChanged
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        //in short
        .map(_userFromFirebaseUser);
  }

//sign in anon
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

//sign up with email and password
  Future signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      UserUpdateInfo userUpdateInfo = UserUpdateInfo()
        ..photoUrl = ''
        ..displayName = name;
      user.updateProfile(userUpdateInfo);
      return _userFromFirebaseUser(user);
      //// create a new document for the user with the uid
      //   await DatabaseService(uid: user.uid)
      //       .updateUserData('Monday', 'new User', 100);
      //   return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

//sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}
