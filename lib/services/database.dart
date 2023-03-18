import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;

  DatabaseService({required this.uid});

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  final CollectionReference logCollection =
      FirebaseFirestore.instance.collection('logs');

  Future updateUserData(
      String firstName, String lastName, String parentEmail) async {
    return await userCollection.doc(uid).set({
      "firstName": firstName,
      "lastName": lastName,
      "parentEmail": parentEmail,
    });
  }
}
