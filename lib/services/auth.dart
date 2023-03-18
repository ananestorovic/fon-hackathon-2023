import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_1/model/userModel.dart';
import 'package:flutter_application_1/services/database.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  UserModel? _userFromFirebase(User? user) {
    return user != null ? UserModel(uid: user.uid) : null;
  }

  Stream<UserModel?> get user {
    return _auth
        .authStateChanges()
        .map((User? user) => _userFromFirebase(user));
  }

  Future sighInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      print(user);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

//login

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

//register

  Future registerWithEmailAndPassword(String firstname, String lastname,
      String email, String password, String parentEmail) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User? user = result.user;

      await DatabaseService(uid: user!.uid)
          .updateUserData(firstname, lastname, parentEmail);

      return _userFromFirebase(user);
    } catch (e) {
      print(e);
      return null;
    }
  }

//logout
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
