import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_web/menu/edituser.dart';

class SearchUserPage extends StatefulWidget {
  const SearchUserPage({Key? key}) : super(key: key);

  @override
  _SearchUserPageState createState() => _SearchUserPageState();
}

class _SearchUserPageState extends State<SearchUserPage> {
  TextEditingController emailController = new TextEditingController();

  String email = " ";
  String uid = " ";
  String firstName = " ";
  String lastName = " ";
  String age = " ";
  String address = " ";
  String occupation = " ";
  String phonenumber = " ";
  bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF077bd7)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Search',
            style: TextStyle(
              color: Color(0xFF077bd7),
            ),
          ),
        ]),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Search User",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
            width: 50,
          ),
          Container(
            width: 400,
            height: 100,
            child: TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
                hintText: "Email",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () async {
              String userEmail = emailController.text.trim();

              final QuerySnapshot snap = await FirebaseFirestore.instance
                  .collection('users')
                  .where('email', isEqualTo: userEmail)
                  .get();
              setState(() {
                email = userEmail;
                uid = snap.docs[0]['uid'];
                firstName = snap.docs[0]['firstName'];
                lastName = snap.docs[0]['lastName'];
                age = snap.docs[0]['age'];
                address = snap.docs[0]['address'];
                occupation = snap.docs[0]['occupation'];
                phonenumber = snap.docs[0]['phonenumber'];

                ableToEdit = true;
              });
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "Get User Data",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          if (ableToEdit)
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditUser(
                              uid: uid,
                              key: null,
                            )));
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Edit User",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          else
            Container(),
          SizedBox(
            height: 50,
          ),
          Text(
            'User Data :',
            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w100),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'Email : ' + email,
          ),
          Text(
            'UID : ' + uid,
          ),
          Text(
            'First Name : ' + firstName,
          ),
          Text(
            'Last Name : ' + lastName,
          ),
          Text(
            'Age : ' + age,
          ),
          Text(
            'Address : ' + address,
          ),
          Text(
            'Occupation : ' + occupation,
          ),
          Text(
            'Phone Number : ' + phonenumber,
          ),
        ],
      ),
    );
  }
}
