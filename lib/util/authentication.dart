import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  final FirebaseAuth auth = FirebaseAuth.instance;
  //UserCredential userCredential;
  //User currentUser;
  //TODO: make this user the logged in user?

  void signOut() {
    try {
      auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  Future createUser(String email, String password, String displayName) async {
    User currentUser;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      currentUser = userCredential.user;
      await currentUser.updateProfile(displayName: displayName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    await currentUser.reload();
    currentUser = auth.currentUser;
    return currentUser;

    // //User u = uc.user;
    // u.updateProfile(displayName: displayName);
    // await user.reload();
    // print(user.displayName);
    // return user;
  }

  //TODO: signin error handling is a bit wonky
  Future signInUser(String email, String password) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      User currentUser = userCredential.user;
      return currentUser;
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
