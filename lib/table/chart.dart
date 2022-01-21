import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_application_web/model/fcmodel.dart';
import 'package:intl/intl.dart';

class Chart extends StatefulWidget {
  final doc;

  const Chart({Key? key, this.doc}) : super(key: key);

  @override
  _ChartState createState() {
    return _ChartState();
  }
}

class _ChartState extends State<Chart> {
  late List<charts.Series<Fish, String>> _seriesBarData;
  late List<Fish> mydata;
  _generateData(mydata) {
    _seriesBarData = <charts.Series<Fish, String>>[];
    _seriesBarData.add(
      charts.Series(
        domainFn: (Fish fish, _) => fish.date.toString(),
        measureFn: (Fish fish, _) => fish.quantity,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        id: 'Fish',
        data: mydata,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Fish Catch')),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(widget.doc)
          .collection('fishcatch')
          .snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return LinearProgressIndicator();
        } else {
          List<Fish> sales = snapshot.data!.docs
              .map((documentSnapshot) =>
                  Fish.fromMap(documentSnapshot.data() as Map<String, dynamic>))
              .toList();
          return _buildChart(context, sales);
        }
      },
    );
  }

  Widget _buildChart(BuildContext context, List<Fish> fishdata) {
    mydata = fishdata;
    _generateData(mydata);
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Text(
              'Fish Catch',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
              child: charts.BarChart(
                _seriesBarData,
                animate: true,
                animationDuration: Duration(seconds: 5),
                behaviors: [
                  charts.DatumLegend(
                    entryTextStyle: charts.TextStyleSpec(
                        color: charts.MaterialPalette.purple.shadeDefault,
                        fontFamily: 'Georgia',
                        fontSize: 18),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
