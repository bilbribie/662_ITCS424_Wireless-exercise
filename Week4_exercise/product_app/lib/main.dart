import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: '6488029'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("6488029")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
            name: "1st Cat",
            description: "The first cat from local image",
            price: 1200,
            isNetworkImage: false,
            image: "cat1 (2).png",
          ),
          ProductBox(
            name: "2nd dog",
            description: "The second dog from local image",
            price: 600,
            isNetworkImage: false,
            image: "cat1 (4).png",
          ),
          ProductBox(
            name: "3rd Cat",
            description: "The third cat from local image",
            price: 200,
            isNetworkImage: false,
            image: "cat1 (5).png",
          ),
          ProductBox(
            name: "1st Cat",
            description: "The first cat from network",
            price: 200,
            isNetworkImage: true,
            image:
                "https://images.unsplash.com/photo-1579168765467-3b235f938439?q=80&w=1888&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          ProductBox(
            name: "2nd Cat",
            description: "The second cat from network",
            price: 560,
            isNetworkImage: true,
            image:
                "https://images.unsplash.com/photo-1583083527882-4bee9aba2eea?q=80&w=1977&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
          ProductBox(
            name: "3rd Cat",
            description: "The third cat from network",
            price: 2400,
            isNetworkImage: true,
            image:
                "https://images.unsplash.com/photo-1604675223954-b1aabd668078?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.isNetworkImage,
    required this.image,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final bool isNetworkImage;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            isNetworkImage
                ? Image.network(
                    image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "assets/appimages/" + image,
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.description),
                    Text("Price: " + this.price.toString()),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
