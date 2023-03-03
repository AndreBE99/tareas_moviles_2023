import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../song.dart';

class FavSongsBloc extends Bloc<FavSongsEvent, FavSongsState> {
  List<Song> favSongs = [
    new Song(
      author: 'Bad Bunny',
      title: 'Ojitos lindos',
      imageUrl:
          'https://e-cdns-images.dzcdn.net/images/cover/b29d1070377b784384c2456093f96a66/120x120-000000-80-0-0.jpg',
      songLink: '',
      spotyLink: '',
    ),
  ];

  FavSongsBloc() : super(FavSongsInitial()) {
    on<GetAllFavsEvent>(getAllFavSongs);
    on<RemoveFavEvent>(removeFavSong);
    on<AddFavSongEvent>(addFavSong);
  }

  FutureOr<void> getAllFavSongs(event, emit) {
    emit(FavSongsSuccessState(favSongs: this.favSongs));
  }

  FutureOr<void> removeFavSong(event, emit) {
    String songToRemove = event.title;
    this.favSongs.removeWhere((element) => element.title == songToRemove);
    emit(FavSongsSuccessState(favSongs: this.favSongs));
  }

  FutureOr<void> addFavSong(event, emit) {
    if (event.songToAdd != null) {
      this.favSongs.add(event.songToAdd);
      emit(FavSongsSuccessState(favSongs: this.favSongs));
    } else {
      emit(FavSongsErrorState());
    }
  }
}

// Eventos

abstract class FavSongsEvent extends Equatable {
  const FavSongsEvent();

  @override
  List<Object> get props => [];
}

class GetAllFavsEvent extends FavSongsEvent {}

class AddFavSongEvent extends FavSongsEvent {
  final Song songToAdd;

  AddFavSongEvent({required this.songToAdd});

  @override
  List<Object> get props => [this.songToAdd];
}

class RemoveFavEvent extends FavSongsEvent {
  final String title;

  RemoveFavEvent({required this.title});

  @override
  List<Object> get props => [this.title];
}

// Estados

abstract class FavSongsState extends Equatable {
  const FavSongsState();

  @override
  List<Object> get props => [];
}

class FavSongsSuccessState extends FavSongsState {
  final List<Song> favSongs;

  FavSongsSuccessState({required this.favSongs});

  @override
  List<Object> get props => [this.favSongs];
}

class FavSongsInitial extends FavSongsState {}

class FavSongsErrorState extends FavSongsState {}
