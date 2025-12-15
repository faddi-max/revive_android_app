import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupRepo {
  final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
  final FirebaseFirestore _cloud = FirebaseFirestore.instance;
  Future<User?> signupuser({
    required String fullname,
    required String email,
    required String password,
    required String phone,
  }) async {
    try {
      UserCredential signupcredentials = await _firebaseauth
          .createUserWithEmailAndPassword(email: email, password: password);

      User? user = signupcredentials.user;
      if (user != null) {
        await _cloud.collection("users").doc(user.uid).set({
          "uid": user.uid,
          "fullname": fullname,
          "email": email,
          "phone": phone,
          "createdAt": DateTime.now(),
        });
        await user.reload();
        return user;
      }
    } on FirebaseException catch (e) {
      throw Exception(e.toString());
    }
  }
}
