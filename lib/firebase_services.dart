import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseServices {

  CollectionReference homeBanner = FirebaseFirestore.instance.collection('homeBanner');
  CollectionReference brandAd = FirebaseFirestore.instance.collection('brandAd');
}