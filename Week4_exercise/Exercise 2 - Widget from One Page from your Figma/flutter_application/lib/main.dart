import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Activity Tracker',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ActivityListPage(),
    );
  }
}

class ActivityListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Activity'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Handle action (e.g., navigate to a new page)
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          ActivityItem(
            date: 'TUE 23 JAN',
            activity: 'Camping',
            temperature: '18 °C',
            location: 'Mae Sot, Tak',
            weather: 'Mostly clear',
          ),
          ActivityItem(
            date: 'TUE 31 JAN',
            activity: 'Do laundry',
            temperature: '35 °C',
            location: 'Bangkok',
            weather: 'Mostly clear',
          ),
          // Add more ActivityItem widgets here as needed
        ],
      ),
    );
  }
}

class ActivityItem extends StatelessWidget {
  final String date;
  final String activity;
  final String temperature;
  final String location;
  final String weather;

  const ActivityItem({
    Key? key,
    required this.date,
    required this.activity,
    required this.temperature,
    required this.location,
    required this.weather,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            date,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: <Widget>[
              Icon(Icons.wb_sunny, color: Colors.orange),
              SizedBox(width: 8),
              Text(temperature),
            ],
          ),
          SizedBox(height: 8),
          Text(
            activity,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(location),
          SizedBox(height: 8),
          Text(weather),
        ],
      ),
    );
  }
}
