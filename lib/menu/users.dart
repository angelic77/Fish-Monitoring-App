import 'package:flutter/material.dart';
import 'package:flutter_application_web/menu/search.dart';
import 'package:flutter_application_web/menu_drawer.dart';
import 'package:flutter_application_web/table/adduserpage.dart';
import 'package:flutter_application_web/table/userpage.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  _UsersState createState() => _UsersState();
}

class _UsersState extends State<Users> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF077bd7)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Users Management',
              style: TextStyle(
                color: Color(0xFF077bd7),
              ),
            ),
            SizedBox(
              width: 200,
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AddUsersPage(),
                  ),
                )
              },
              child: Text('Add', style: TextStyle(fontSize: 30.0)),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            ),
            ElevatedButton(
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchUserPage(),
                  ),
                )
              },
              child: Text('Search', style: TextStyle(fontSize: 30.0)),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            )
          ],
        ),
      ),
      drawer: MenuDrawer(),
      body: ListUsersPage(),
    );
  }
}
