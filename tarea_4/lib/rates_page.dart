// ignore_for_file: dead_code

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tarea_4/data/constants.dart';

import 'exchanges_page.dart';
import 'home_page.dart';
import 'trending_page.dart';

class Rates extends StatefulWidget {
  Rates({super.key});

  @override
  State<Rates> createState() => _RatesState();
}

class _RatesState extends State<Rates> {
  var rates = jsonDecode(CRYPTO_EXCHANGE_RATES)["rates"];
  var keys = jsonDecode(CRYPTO_EXCHANGE_RATES)["rates"].keys.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rates'),
      ),
      body: ListView.separated(
        itemCount: rates.length,
        separatorBuilder: (BuildContext context, index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("${rates[keys[index]]["name"]}"),
            subtitle: Text("Valor: ${rates[keys[index]]["value"]}"),
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
