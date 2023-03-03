import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahzam_v1/bloc/fav_songs_bloc.dart';
import 'package:shahzam_v1/song.dart';
import 'package:shahzam_v1/screens/song_page.dart';

class SmallCard extends StatefulWidget {
  final Song song;

  SmallCard({
    required this.song,
  });

  @override
  State<SmallCard> createState() => _SmallCardState();
}

class _SmallCardState extends State<SmallCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color.fromARGB(255, 126, 126, 126),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SongPage(
                        song: widget.song,
                      ),
                    ),
                  );
                },
                child: Image(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    this.widget.song.imageUrl,
                    // scale: 4.0,
                  ),
                ),
              ),
              Positioned(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                        30), // Establece el radio del borde redondeado
                    color: Colors.white, // Establece el color de fondo
                  ),
                  child: IconButton(
                    icon:
                        Icon(Icons.heart_broken, color: Colors.black, size: 30),
                    onPressed: () {
                      const snackBar = SnackBar(
                        content: Text('Eliminado de favoritos'),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      BlocProvider.of<FavSongsBloc>(context)
                          .add(RemoveFavEvent(title: this.widget.song.title));
                      setState(() {});
                    },
                  ),
                ),
                top: 10.0,
                left: 10.0,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              this.widget.song.title,
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
              this.widget.song.author,
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
