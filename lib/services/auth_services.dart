import 'package:firebase_auth/firebase_auth.dart';
import 'package:multivendorapp/services/db_serivce.dart';

class AuthServices {
  var firebaseAuthInstance = FirebaseAuth.instance;
  //register

  registerUser(String email, String password) async {
    try {
      UserCredential user = await firebaseAuthInstance
          .createUserWithEmailAndPassword(email: email, password: password);
      var database = DataBaseService();
      await database.sendUserToDataBase(user.user!.uid, user.user!.email!);
    } catch (e) {
      rethrow;
    }
  }
}
