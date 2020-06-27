import 'package:cloud_firestore/cloud_firestore.dart';

class Spot {

  bool confirmed;
  double due;
  bool insurance;
  bool license;
  int spot;
  String owner;

  DocumentReference reference;

  Spot({this.confirmed, this.due, this.insurance, this.license, this.spot, this.owner, this.reference});

  factory Spot.fromSnapshot(DocumentSnapshot snapshot) {
    Spot newSpot = Spot.fromJson(snapshot.data);
    newSpot.reference = snapshot.reference;
    return newSpot;
  }

  factory Spot.fromJson(Map<String, dynamic> json) {
    return Spot(
      confirmed: json['confirmed'] as bool,
      due: json['due'] as double,
      insurance: json['insurance'] as bool,
      license: json['license'] as bool,
      spot: json['spot'] as int,
      owner: json['owner'] as String,
    );
  }

  Map<String, dynamic> toJson() => _StudentToJson(this);

  Map<String, dynamic> _StudentToJson(Spot instance) {
    return <String, dynamic> {
      'confirmed': instance.confirmed,
      'due': instance.due,
      'insurance': instance.insurance,
      'license': instance.license,
      'spot': instance.spot,
      'owner': instance.owner,
    };
  }

}