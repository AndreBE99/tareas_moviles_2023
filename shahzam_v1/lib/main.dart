import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:shahzam_v1/bloc/fav_songs_bloc.dart';
import 'package:shahzam_v1/bloc/recorder_bloc.dart';
import 'package:shahzam_v1/screens/home_page.dart';

void main() async {
  await dotenv.load(fileName: '.env');
  return runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => FavSongsBloc()..add((GetAllFavsEvent())),
      ),
      BlocProvider(
        create: (context) => RecorderBloc(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: 'MusicFindApp',
      home: HomePage(),
    );
  }
}
