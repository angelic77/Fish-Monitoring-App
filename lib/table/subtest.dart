import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SubCategoery extends StatefulWidget {
  final doc;
  SubCategoery(this.doc);

  @override
  _SubCategoryClassState createState() => _SubCategoryClassState();
}

class _SubCategoryClassState extends State<SubCategoery> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SubCategories"),
        centerTitle: true,
      ),
      body: Scrollbar(
        isAlwaysShown: true,
        child: new StreamBuilder<QuerySnapshot>(
          stream: db
              .collection('users')
              .doc(widget.doc)
              .collection('fishcatch')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var doc = snapshot.data!.docs;
              return new ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Text(
                                "Species Name: ${snapshot.data!.docs[index]['speciesname']}"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                                "Fish Catch: ${snapshot.data!.docs[index]['quantity']}kg"),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                                "Date: ${(snapshot.data!.docs[index]['date'] as Timestamp).toDate()}"),
                          ],
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
    );
  }
}
