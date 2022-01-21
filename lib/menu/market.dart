import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_web/market/addmarket.dart';
import 'package:flutter_application_web/market/listmarket.dart';
import 'package:flutter_application_web/menu_drawer.dart';

class MarketPrice extends StatefulWidget {
  const MarketPrice({Key? key}) : super(key: key);

  @override
  _MarketPriceState createState() => _MarketPriceState();
}

class _MarketPriceState extends State<MarketPrice> {
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
                'Market Price',
                style: TextStyle(
                  color: Color(0xFF077bd7),
                ),
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddMarketPage(),
                    ),
                  )
                },
                child: Text('Add', style: TextStyle(fontSize: 30.0)),
                style: ElevatedButton.styleFrom(primary: Colors.blue),
              )
            ],
          ),
        ),
        drawer: MenuDrawer(),
        body: ListMarketPage());
  }
}
