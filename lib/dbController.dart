import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class DBController {
  String getUrls() {
    var db = FirebaseFirestore.instance;
    List<String> urls = [];
    db.collection("pictures").get().then((event) {
      for (var doc in event.docs) {
        print("${doc.id} => ${doc.data()}");
      }
    });
    return 'https://dyoevents-b1aca-default-rtdb.firebaseio.com/';
  }
}

