import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shahzam_v1/song.dart';
import 'package:record/record.dart';
import 'dart:convert';

class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  Record record = Record();

  RecorderBloc() : super(RecorderInitial()) {
    on<StartRecordingEvent>(startRecording);
  }

  FutureOr<void> startRecording(event, emit) async {
    if (!await record.hasPermission()) {
      emit(RecorderFailedState);
    }

    Directory applicationDocumentsDirectory =
        await getApplicationDocumentsDirectory();
    String applicationDocumentsPath = applicationDocumentsDirectory.path;
    String filePath = '$applicationDocumentsPath/audio.mp3';

    await record.start(
      path: filePath,
    );

    emit(RecorderRecordingState());
    bool isRecording = await record.isRecording();

    if (!isRecording) {
      print('Error while stopping recording');
      emit(RecorderFailedState());
    }

    sleep(Duration(seconds: 5));
    String? path = await record.stop();
    final file = File(path!);
    final bytes = await file.readAsBytes();
    final base64 = base64Encode(bytes);

    Uri url =
        Uri.parse('https://api.audd.io/?return=apple_music,spotify,deezer');
    Response response = await post(url, body: {
      'api_token': dotenv.env['API_KEY'],
      'audio': base64,
    });
    print('Response status: ${response.statusCode}');
    final result = await jsonDecode(response.body);
    dynamic songFound = result;
    print(songFound);

    if (songFound['result'] == null) {
      Song song = Song(
        author: 'No encontrado',
        title: 'No encontrado',
        imageUrl: 'https://source.unsplash.com/random',
        songLink: 'No encontrado',
        spotyLink: 'No encontrado',
      );
      emit(RecorderSuccessState(song: song));
    } else {
      Song song = Song(
        author: songFound['result']?['artist'] ?? 'No author',
        title: songFound['result']?['title'] ?? 'No Title',
        imageUrl:
            songFound['result']?['deezer']?['album']?['cover'] ?? 'No imageUrl',
        songLink: songFound['result']?['song_link'] ?? 'No song link',
        spotyLink: songFound['result']?['spotify']?['external_urls']
                ?['spotify'] ??
            'No spoty link',
      );
      print(song);
      emit(RecorderSuccessState(song: song));
    }
  }
}

// Eventos

abstract class RecorderEvent extends Equatable {
  const RecorderEvent();

  @override
  List<Object> get props => [];
}

class StartRecordingEvent extends RecorderEvent {}

// Estados

abstract class RecorderState extends Equatable {
  const RecorderState();

  @override
  List<Object> get props => [];
}

class RecorderInitial extends RecorderState {}

class RecorderSuccessState extends RecorderState {
  final Song song;

  RecorderSuccessState({required this.song});

  @override
  List<Object> get props => [this.song];
}

class RecorderFailedState extends RecorderState {}

class RecorderRecordingState extends RecorderState {}
