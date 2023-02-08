import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final String titulo;
  final String descripcion;
  final String image;

  ItemActividad(
      {super.key,
      required this.titulo,
      required this.descripcion,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            // color: Colors.purple,
            child: Image.network("${image}"),
          ),
          Text("${titulo}", style: TextStyle(fontSize: 11)),
          Text("${descripcion}"),
        ],
      ),
    );
  }
}
