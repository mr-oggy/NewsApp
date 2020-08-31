import 'package:firebase_auth/firebase_auth.dart';
import 'package:news/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
//create user object based on firebasedUser

  User getCurrentUser() {
    return _auth.currentUser;
  }

  UserModel _userFromFirebaseUser(User user) {
    return user != null
        ? UserModel(
            uid: user.uid,
            name: user.displayName,
            email: user.email,
          )
        : null;
  }

//auth change user streem
  Stream<UserModel> get user {
    return _auth
        .authStateChanges()
        //.map((FirebaseUser user) => _userFromFirebaseUser(user));
        //in short
        .map(_userFromFirebaseUser);
  }

//sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      return null;
    }
  }

//sign up with email and password
  Future signUpWithEmailAndPassword(
      String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      user.updateProfile(
        displayName: name, //Todo: photoURL: uploadedFileURL.toString
      );
      return _userFromFirebaseUser(user);
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
