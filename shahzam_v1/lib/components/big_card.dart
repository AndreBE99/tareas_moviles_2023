// ignore_for_file: unnecessary_this, prefer_const_constructors_in_immutables, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BigCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String author;
  final String spotyLink;

  BigCard({
    required this.author,
    required this.title,
    required this.imageUrl,
    required this.spotyLink,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image(
            height: MediaQuery.of(context).size.height / 2,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
            image: NetworkImage(
              this.imageUrl,
              scale: 4.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.author,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              GestureDetector(
                onTap: () {
                  launchUrl(Uri.parse('$spotyLink'));
                },
                child: Image(
                  image: AssetImage('images/spotify.png'),
                  height: 40.0,
                  color: Colors.grey[200],
                ),
              ),
              SizedBox(width: 30.0),
              Image(
                image: AssetImage('images/podcast.png'),
                height: 40.0,
                color: Colors.grey[200],
              ),
              SizedBox(width: 30.0),
              Image(
                image: AssetImage('images/apple.png'),
                height: 50.0,
                color: Colors.grey[200],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
