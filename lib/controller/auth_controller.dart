import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/consts.dart';

class AuthController extends GetxController {
  // login
  Future<UserCredential?> loginMethod(
      {required String email, required String password, required BuildContext context}) async {
    UserCredential? userCredential;
    try {
      userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        message: "Invalid Credentials",
        snackbarColor: Colors.red,
      );
    }
    return userCredential;
  }

  // Signup
  Future<UserCredential?> signupMethod({email, password, context}) async {
    UserCredential? userCredential;
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      showSnackBar(
        context: context,
        message: "An Error Occurred!!!",
        snackbarColor: Colors.red,
      );
      // VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  // storing data method
  storeUserData({name, email, password}) async {
    DocumentReference store = firestore.collection(usersCollection).doc(currentUser!.uid);
    store.set({'name': name, 'email': email, 'password': password, 'image': ''});
  }

  // signOut
  signOutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }

  // get user Data after login
  getUserDetailsByEmail(context, email) async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;

    final QuerySnapshot result = await firestore.collection('users').where('email', isEqualTo: email).get();
    final List<DocumentSnapshot> docs = result.docs;

    if (docs.isEmpty) {
      // No user found with the given email
      debugPrint('No user found with this email');
      showSnackBar(
        context: context,
        message: "ERROR!!!!",
        snackbarColor: Colors.red,
      );
    } else {
      // User found
      var data = docs[0].data();
      if (data != null) {
        Map<String, dynamic> userData = data as Map<String, dynamic>;
        String userName = userData['name'];
        showSnackBar(
          context: context,
          message: 'Welcome $userName',
          snackbarColor: Colors.green,
        );
      } else {
        debugPrint('No data found in the document');
      }
    }
  }
}
