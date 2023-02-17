import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarea_4/data/constants.dart';

import 'home_page.dart';
import 'rates_page.dart';
import 'trending_page.dart';

class Exchanges extends StatefulWidget {
  Exchanges({super.key});

  @override
  State<Exchanges> createState() => _ExchangesState();
}

class _ExchangesState extends State<Exchanges> {
  var exchanges = jsonDecode(CRYPTO_EXCHANGES) as List;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exchanges'),
      ),
      body: ListView.separated(
        itemCount: exchanges.length,
        separatorBuilder: (BuildContext context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Image.network("${exchanges[index]["image"]}", width: 40),
            title: Text("${exchanges[index]["name"]}"),
            subtitle: Text(
                "${exchanges[index]["country"]}\n${exchanges[index]["year_established"]}"),
            trailing: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("${exchanges[index]["trust_score"]}"),
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
                        // ignore: dead_code
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
