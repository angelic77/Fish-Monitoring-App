import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class EditUser extends StatefulWidget {
  final String uid;

  EditUser({required Key? key, required this.uid}) : super(key: key);
  @override
  _EditUserState createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  TextEditingController firstnameController = new TextEditingController();
  TextEditingController lastnameController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController occupationController = new TextEditingController();
  TextEditingController phonenumberController = new TextEditingController();
  TextEditingController addressController = new TextEditingController();

  clearText() {
    firstnameController.clear();
    lastnameController.clear();
    ageController.clear();
    addressController.clear();
    occupationController.clear();
    phonenumberController.clear();
  }

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
            'Update',
            style: TextStyle(
              color: Color(0xFF077bd7),
            ),
          ),
        ]),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: firstnameController,
            decoration: InputDecoration(hintText: "Firstname..."),
          ),
          TextFormField(
            controller: lastnameController,
            decoration: InputDecoration(hintText: "Lastname..."),
          ),
          TextFormField(
            controller: ageController,
            decoration: InputDecoration(hintText: "Age..."),
          ),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(hintText: "Address..."),
          ),
          TextFormField(
            controller: occupationController,
            decoration: InputDecoration(hintText: "Occupation..."),
          ),
          TextFormField(
            controller: phonenumberController,
            decoration: InputDecoration(hintText: "PhoneNumber..."),
          ),
          GestureDetector(
            onTap: () async {
              String newFirstname = firstnameController.text.trim();
              String newLastname = lastnameController.text.trim();
              String newAge = ageController.text.trim();
              String newAddress = addressController.text.trim();
              String newPhonenumber = phonenumberController.text.trim();
              String newOccupation = occupationController.text.trim();

              FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.uid)
                  .update({
                'firstName': newFirstname,
                'lastName': newLastname,
                'age': newAge,
                'address': newAddress,
                'phonenumber': newPhonenumber,
                'occupation': newOccupation,
              });

              clearText();
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "UPDATE DATA",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
