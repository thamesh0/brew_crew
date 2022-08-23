import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? uid;
  DatabaseService({this.uid});
//  Collection reference
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection('brews');

  Future updateUserData(String sugars, String name, int strength) async {
    return await brewCollection
        .doc(uid)
        .set({'sugars': sugars, 'name': name, 'strength': strength});
  }

  // get brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
          name: doc['name'], sugars: doc['sugars'], strength: doc['strength']);
    }).toList();
  }

  MyUser _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return MyUser(
      uid: uid!,
      name: snapshot['name'],
      sugars: snapshot['sugars'],
      strength: snapshot['strength'],
    );
  }

  Stream<List<Brew>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }

  Stream<MyUser> get userData {
    return brewCollection.doc(uid).snapshots().map(_userDataFromSnapshot);
  }
}
