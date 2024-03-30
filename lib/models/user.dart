import 'package:cloud_firestore/cloud_firestore.dart';

class User {

  String name;
  String email;
  String uid;
  String url;
  String spotuid;

  DocumentReference reference;

  User({required this.name, required this.email, required this.uid, required this.url, required this.spotuid, required this.reference});

  factory User.fromSnapshot(DocumentSnapshot snapshot) {
    User newUser = User.fromJson(snapshot.data()! as Map<String, dynamic>);
    newUser.reference = snapshot.reference;
    return newUser;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['displayName'] as String,
      email: json['email'] as String,
      uid: json['uid'] as String,
      url: json['url'] as String,
      spotuid: json['spotuid'] as String, 
      reference: ,
    );
  }

  Map<String, dynamic> toJson() => _StudentToJson(this);

  Map<String, dynamic> _StudentToJson(User instance) {
    return <String, dynamic> {
      'displayName': instance.name,
      'email': instance.email,
      'uid': instance.uid,
    };
  }
}