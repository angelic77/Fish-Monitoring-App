import 'package:flutter/material.dart';
import 'package:flutter_application_web/menu_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class DemandForecast extends StatefulWidget {
  const DemandForecast({Key? key}) : super(key: key);

  @override
  _DemandForecastState createState() => _DemandForecastState();
}

class _DemandForecastState extends State<DemandForecast> {
  @override
  Widget build(BuildContext context) {
    String greetings = '';
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF077bd7)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Demand Forecasting',
          style: TextStyle(
            color: Color(0xFF077bd7),
          ),
        ),
      ),
      drawer: MenuDrawer(),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Show Demand Forecasting'),
        ),
      ),
    );
  }
}

_launchURL() async {
  const url = 'http://127.0.0.1:5000/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
