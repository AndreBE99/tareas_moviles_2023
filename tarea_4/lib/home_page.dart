// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:tarea_4/exchanges_page.dart';
import 'package:tarea_4/rates_page.dart';
import 'package:tarea_4/trending_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Text("Bienvenido a la mejor app de crypto!",
            style: TextStyle(
              fontSize: 40,
              color: Colors.black,
            ),
            textAlign: TextAlign.center),
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
