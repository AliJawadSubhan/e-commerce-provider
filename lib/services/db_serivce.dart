import 'package:cloud_firestore/cloud_firestore.dart';

class DataBaseService {
  var fireStoreInstance = FirebaseFirestore.instance;

  sendUserToDataBase(String uid, String email) async {
    var users = fireStoreInstance.collection('users').doc(uid);

    await users.set({
      'email': email,
    });
  }
}
