import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth auth = FirebaseAuth.instance;
  UserCredential userCredential;
  User user;
  //TODO: make this user the logged in user?

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future<UserCredential> createUser(String email, String password) async {
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return userCredential;
  }

  //TODO: signin error handling is a bit wonky
  Future signInUser(String email, String password) async {
    try {
      userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.message);
    }
  }

  // Future signInUser(String email, String password) async {
  //   try {
  //     userCredential = await auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       return ('No user found for that email.');
  //     } else if (e.code == 'wrong-password') {
  //       return ('Wrong password provided for that user.');
  //     }
  //   }
  //   return userCredential;
  // }
}
