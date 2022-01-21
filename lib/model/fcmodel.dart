import 'package:cloud_firestore/cloud_firestore.dart';

class Fish {
  final int quantity;
  final Timestamp date;
  Fish(
    this.quantity,
    this.date,
  );

  Fish.fromMap(Map<String, dynamic> map)
      : assert(map['quantity'] != null),
        assert(map['date'] != null),
        quantity = map['quantity'],
        date = map['date'];

  @override
  String toString() => "Record<$quantity:$date>";
}
