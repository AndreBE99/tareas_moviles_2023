import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahzam_v1/bloc/fav_songs_bloc.dart';
import 'package:shahzam_v1/song.dart';

import '../components/big_card.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key, required this.song});

  final Song song;

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  IconData icn = Icons.favorite;
  bool fav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          BlocConsumer<FavSongsBloc, FavSongsState>(
            listener: (context, state) {},
            builder: (context, state) {
              return IconButton(
                onPressed: () {
                  if (fav == false) {
                    const snackBar = SnackBar(
                      content: Text('Agregado a favoritos'),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    BlocProvider.of<FavSongsBloc>(context)
                        .add(AddFavSongEvent(songToAdd: widget.song));
                    setState(() {
                      icn = Icons.heart_broken;
                      fav = true;
                    });
                  } else {
                    const snackBar = SnackBar(
                      content: Text('Eliminado de favoritos'),
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    BlocProvider.of<FavSongsBloc>(context)
                        .add(RemoveFavEvent(title: widget.song.title));
                    setState(() {
                      icn = Icons.favorite;
                      fav = false;
                    });
                  }
                },
                icon: Icon(
                  icn,
                ),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigCard(
              author: widget.song.author,
              title: widget.song.title,
              imageUrl: widget.song.imageUrl,
              spotyLink: widget.song.spotyLink,
            ),
          ],
        ),
      ),
    );
  }
}
