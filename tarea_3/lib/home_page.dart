import 'package:flutter/material.dart';
import 'package:tarea_3/info_lugar.dart';
import 'package:tarea_3/item_actividad.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> _listElements = [
    {
      "title": "Day 1",
      "description": "Machu Picchu",
      "image":
          "https://www.perurail.com/wp-content/uploads/2021/09/Machu-Picchu.jpg",
    },
    {
      "title": "Day 2",
      "description": "Roma",
      "image":
          "https://www.perurail.com/wp-content/uploads/2021/09/Coliseo-Romano.jpg",
    },
    {
      "title": "Day 3",
      "description": "Taj Mahal",
      "image":
          "https://www.perurail.com/wp-content/uploads/2021/09/Taj-Mahal.jpg",
    },
    {
      "title": "Day 4",
      "description": "Chichén Itzá",
      "image":
          "https://www.perurail.com/wp-content/uploads/2021/09/Chichen-Itz%C3%A1-.jpg",
    },
    {
      "title": "Day 5",
      "description": "Cristo Redentor",
      "image":
          "https://www.perurail.com/wp-content/uploads/2021/09/Cristo-Redentor.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reserva tu hotel'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.topCenter,
                // child: Container(
                //   height: 150,
                //   width: MediaQuery.of(context).size.width,
                //   color: Colors.green,
                // ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Positioned.fill(
                      child: Image.network(
                          "https://www.iteso.mx/image/journal/article?img_id=1719440&t=1425257397292")),
                ),
              ),
              // para poder poner column o listview en stack hay que encerrarlas en positioned y anclarla a todos lados
              Positioned(
                top: 64,
                bottom: 0,
                left: 0,
                right: 0,
                child: ListView(
                  children: [
                    InfoLugar(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Details"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            foregroundColor: Colors.grey[200],
                          ),
                        ),
                        Text("Walkthrough Flight Detail"),
                      ],
                    ),
                    Container(
                      height: 200,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _listElements.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ItemActividad(
                            titulo: _listElements[index]["title"]!,
                            descripcion: _listElements[index]["description"]!,
                            image: _listElements[index]["image"]!,
                          );
                        },
                      ),
                    ),
                    MaterialButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(SnackBar(
                              content: Text("Reservación en progreso")));
                        setState(() {});
                      },
                      child: Text(
                        "Start booking",
                        style: TextStyle(color: Colors.grey[200]),
                      ),
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
