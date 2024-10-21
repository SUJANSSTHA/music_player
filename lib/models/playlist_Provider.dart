import 'package:flutter/material.dart';
import 'package:music_player/models/songs.dart';

class PlaylistProvider extends ChangeNotifier{
  //! playlist of songs
  final List<Song> _playlist = [];
}