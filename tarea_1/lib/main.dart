import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool tap1 = false;
  bool tap2 = false;
  bool tap3 = false;
  bool tap4 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Mc Flutter Andre'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          height: 140,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(1),
                    child: Icon(Icons.account_circle, size: 50),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Flutter McFlutter",
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        "Experienced App Developer",
                        style: TextStyle(fontSize: 11),
                      )
                    ],
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("123 Main Street", style: TextStyle(fontSize: 15)),
                  Text("(123) 4567-8901", style: TextStyle(fontSize: 15))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      iconSize: 30,
                      color: tap1 ? Colors.indigo : Colors.black,
                      onPressed: () {
                        tap1 = !tap1;
                        setState(() {});
                      },
                      icon: Icon(Icons.accessibility_new)),
                  IconButton(
                      iconSize: 30,
                      color: tap2 ? Colors.indigo : Colors.black,
                      onPressed: () {
                        tap2 = !tap2;
                        setState(() {});
                      },
                      icon: Icon(Icons.timer)),
                  IconButton(
                      iconSize: 30,
                      color: tap3 ? Colors.indigo : Colors.black,
                      onPressed: () {
                        tap3 = !tap3;
                        setState(() {});
                      },
                      icon: Icon(Icons.phone_android)),
                  IconButton(
                      iconSize: 30,
                      color: tap4 ? Colors.indigo : Colors.black,
                      onPressed: () {
                        tap4 = !tap4;
                        setState(() {});
                      },
                      icon: Icon(Icons.phone_iphone)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
