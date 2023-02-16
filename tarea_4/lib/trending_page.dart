// ignore_for_file: dead_code

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarea_4/data/constants.dart';

import 'exchanges_page.dart';
import 'home_page.dart';
import 'rates_page.dart';

class Trending extends StatefulWidget {
  Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  var trending = jsonDecode(CRYPTO_TRENDING)["coins"] as List;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending'),
      ),
      body: ListView.separated(
        itemCount: trending.length,
        separatorBuilder: (BuildContext context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading:
                Image.network("${trending[index]["item"]["large"]}", width: 40),
            title: Text("${trending[index]["item"]["name"]}"),
            subtitle:
                Text("Precio en btc: ${trending[index]["item"]["price_btc"]}"),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("${trending[index]["item"]["score"]}"),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: true
                        ? NetworkImage(
                            'https://image.cnbcfm.com/api/v1/image/107069560-1654078537245-gettyimages-1235570446-porzycki-cryptocu210928_npIa0.jpeg?v=1671628801')
                        : AssetImage('assets/images/noImageAvailable.png')
                            as ImageProvider),
              ),
              child: Text('Menu',
                  style: TextStyle(color: Colors.white, fontSize: 30)),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => HomePage(),
                ));
              },
            ),
            ListTile(
              title: const Text('Rates'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Rates(),
                ));
              },
            ),
            ListTile(
              title: const Text('Exchanges'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Exchanges(),
                ));
              },
            ),
            ListTile(
              title: const Text('Trending'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => Trending(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
