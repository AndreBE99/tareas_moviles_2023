import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shahzam_v1/bloc/recorder_bloc.dart';
import 'package:shahzam_v1/song.dart';
import 'package:shahzam_v1/screens/song_page.dart';
import 'package:shahzam_v1/screens/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String msg = "Toca para escuchar";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                msg,
                style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 3),
              ),
              BlocConsumer<RecorderBloc, RecorderState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is RecorderInitial) {
                    return GestureDetector(
                      onTap: () async {
                        await BlocProvider.of<RecorderBloc>(context)
                          ..add(StartRecordingEvent());
                        setState(() {
                          msg = "Escuchando...";
                        });
                      },
                      child: CircleAvatar(
                        minRadius: 50.0,
                        maxRadius: 75.0,
                        backgroundImage: AssetImage('images/escuchar.jpg'),
                      ),
                    );
                  } else if (state is RecorderSuccessState) {
                    return Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Song song = state.song;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SongPage(
                                  song: song,
                                ),
                              ),
                            );
                            setState(() {
                              msg = "Toca para escuchar";
                            });
                          },
                          child: Text('Ver canción'),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await BlocProvider.of<RecorderBloc>(context)
                              ..add(StartRecordingEvent());
                            setState(() {
                              msg = "Escuchando...";
                            });
                          },
                          child: CircleAvatar(
                            minRadius: 50.0,
                            maxRadius: 75.0,
                            backgroundImage: AssetImage('images/escuchar.jpg'),
                          ),
                        ),
                      ],
                    );
                  }
                  return Center(
                    child: Text(
                      'Cargando...',
                    ),
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                          30), // Establece el radio del borde redondeado
                      color: Colors.white, // Establece el color de fondo
                    ),
                    child: IconButton(
                      icon: Icon(Icons.favorite, color: Colors.black, size: 30),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const FavsPage()));
                      },
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      )),
    );
  }
}
