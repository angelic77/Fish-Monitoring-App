import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_web/table/chart.dart';
import 'package:flutter_application_web/table/subtest.dart';

class Test extends StatefulWidget {
  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test> {
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('User Collection'),
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: db.collection('users').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var doc = snapshot.data!.docs;
                return new ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            //print(doc[index].documentID);
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Chart(docID: doc[index].id,)),
                            );
                          },
                          child: Card(
                            child: Column(
                              children: <Widget>[
                                Text(snapshot.data!.docs[index]['firstName']),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(snapshot.data!.docs[index]['lastName']),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return LinearProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}
