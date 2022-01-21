import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_web/table/updatepage.dart';

class ListUsersPage extends StatefulWidget {
  const ListUsersPage({Key? key}) : super(key: key);

  @override
  _ListUsersPageState createState() => _ListUsersPageState();
}

// For Deleting User
CollectionReference users = FirebaseFirestore.instance.collection('users');
Future<void> deleteUser(id) {
  // print("User Deleted $id");
  return users
      .doc(id)
      .delete()
      .then((value) => print('User Deleted'))
      .catchError((error) => print('Failed to Delete user: $error'));
}

class _ListUsersPageState extends State<ListUsersPage> {
  final Stream<QuerySnapshot> marketStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: marketStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            print('Something went Wrong');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final List storedocs = [];
          snapshot.data!.docs.map((DocumentSnapshot document) {
            Map a = document.data() as Map<String, dynamic>;
            storedocs.add(a);
            a['id'] = document.id;
          }).toList();

          return Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            child: Scrollbar(
              isAlwaysShown: true,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(columns: [
                  DataColumn(label: Text('First Name')),
                  DataColumn(label: Text('Last Name')),
                  DataColumn(label: Text('User ID')),
                  DataColumn(label: Text('Age')),
                  DataColumn(label: Text('Occupation')),
                  DataColumn(label: Text('Phonenumber')),
                  DataColumn(label: Text('Address')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Action')),
                ], rows: [
                  for (var i = 0; i < storedocs.length; i++) ...[
                    DataRow(cells: [
                      DataCell(Text(storedocs[i]['firstName'])),
                      DataCell(Text(storedocs[i]['lastName'])),
                      DataCell(Text(storedocs[i]['uid'])),
                      DataCell(Text(storedocs[i]['age'])),
                      DataCell(Text(storedocs[i]['occupation'])),
                      DataCell(Text(storedocs[i]['phonenumber'])),
                      DataCell(Text(storedocs[i]['address'])),
                      DataCell(Text(storedocs[i]['email'])),
                      DataCell(
                        IconButton(
                          onPressed: () => {deleteUser(storedocs[i]['id'])},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ]),
                  ]
                ]),
              ),
            ),
          );
        });
  }
}
