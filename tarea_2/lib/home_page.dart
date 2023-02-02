// import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  bool tap = false;
  bool tap1 = false;
  bool tap2 = false;
  bool tap3 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenidos al ITESO'),
      ),
      body: ListView(
        children: [
          Image.network(
            'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg',
          ),
          ListTile(
            title: Text("El ITESO, Universidad Jesuita de Guadalajara"),
            subtitle: Text("Periférico Sur 8585"),
            trailing: Wrap(children: [
              IconButton(
                  color: tap ? Colors.indigo : Colors.black54,
                  onPressed: () {
                    counter++;
                    tap = !tap;
                    setState(() {});
                  },
                  icon: Icon(Icons.thumb_up)),
              Text("$counter")
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(1),
                      child: IconButton(
                        color: tap1 ? Colors.indigo : Colors.black,
                        iconSize: 50,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text(
                                    "Puedes encontrar comida en sus cafeterías")));
                          tap1 = !tap1;
                          setState(() {});
                        },
                        icon: Icon(Icons.restaurant),
                      )),
                  Text("Comida"),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(1),
                      child: IconButton(
                        color: tap2 ? Colors.indigo : Colors.black,
                        iconSize: 50,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text(
                                    "Puedes pedir información en rectoría")));
                          tap2 = !tap2;
                          setState(() {});
                        },
                        icon: Icon(Icons.info_rounded),
                      )),
                  Text("Información"),
                ],
              ),
              Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(1),
                      child: IconButton(
                        color: tap3 ? Colors.indigo : Colors.black,
                        iconSize: 50,
                        onPressed: () {
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(SnackBar(
                                content: Text(
                                    "Se encuentra ubicado en Periférico Sur 8585")));
                          tap3 = !tap3;
                          setState(() {});
                        },
                        icon: Icon(Icons.pin_drop),
                      )),
                  Text("Ubicación"),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Text(
                "El ITESO, Universidad Jesuita de Guadalajara, es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita que integra a ocho universidades en México.",
                textAlign: TextAlign.justify),
          )
        ],
      ),
    );
  }
}
