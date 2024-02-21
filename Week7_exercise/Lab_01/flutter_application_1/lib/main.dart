import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO TASK #2: Initialize Firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: StreamBuilder<QuerySnapshot>(
        // TODO TASK #3: Set the stream to listen to 'human' collection
        stream: FirebaseFirestore.instance.collection('human').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData) {
            return const Text('No data available');
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data?.docs.length ?? 0,
            itemBuilder: (context, index) {
              var doc = snapshot.data?.docs[index].data() as Map<String, dynamic>;
              // TODO TASK #4: Display the data in ListTile
              return ListTile(
                title: Text(doc['fullname'] ?? 'No name provided'),
                subtitle: Text('Hobby: ${doc['hobby'] ?? 'No hobby provided'}'),
                trailing: Text('ID: ${doc['stu_ID'] ?? 'No ID provided'}'),
              );
            },
          );
        },
      ),
    );
  }
}
