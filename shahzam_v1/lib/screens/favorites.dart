import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahzam_v1/bloc/fav_songs_bloc.dart';
import 'package:shahzam_v1/components/small_card.dart';

class FavsPage extends StatefulWidget {
  const FavsPage({Key? key}) : super(key: key);

  @override
  State<FavsPage> createState() => _FavsPageState();
}

class _FavsPageState extends State<FavsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("Favoritos"),
      ),
      body: Container(
        child: BlocConsumer<FavSongsBloc, FavSongsState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is FavSongsSuccessState) {
              return ListView.builder(
                  padding: EdgeInsets.all(8.0),
                  itemCount: state.favSongs.length,
                  itemBuilder: (context, index) {
                    return SmallCard(
                      song: state.favSongs[index],
                    );
                  });
            }
            return Row(
              children: [
                Text('Error :('),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            );
          },
        ),
      ),
    );
  }
}
