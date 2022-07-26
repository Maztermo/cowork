import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  CollectionReference<Map<String, dynamic>> userCollection =
      FirebaseFirestore.instance.collection("users");

  Future<String> getUserName() async {
    String userName;
    try {
      var userDoc = await userCollection
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .get();
      userName = userDoc["userName"];
    } catch (e) {
      userName = "Anonymous";
    }

    return userName;
  }
}
