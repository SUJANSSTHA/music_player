// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:music_player/components/new_box.dart';
import 'package:music_player/models/playlist_Provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  

  @override
  //! convert duration into min: sec
  String formatTime(Duration duration) {
  String twoDigitSeconds = duration.inSeconds.remainder(60).toString().padLeft(2, '0');
  String formattedTime = "${duration.inMinutes}:$twoDigitSeconds";

  return formattedTime;
}




  Widget build(BuildContext context) {
    return Consumer<PlaylistProvider>(
      builder: (context, value, child){

          //! get the playlist
          final playList = value.playlist;

          //! get current song index
          final currentSong = playList[value.currentSongIndex ?? 0];

        //! return scaffold UI

        return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //! App bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.arrow_back),
                    ),
                    Text("P L A Y L I S T"),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.menu),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                //! Album artwork
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(currentSong.albumArtImagePath),
                      ),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  currentSong.songName,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(currentSong.artistName),
                              ],
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),

                //! Song duration progress
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //! start time
                         Text(formatTime(value.currentDuration)),
                          Icon(Icons.shuffle),
                          Icon(Icons.repeat),

                          //! end time
                         Text(formatTime(value.totalDuration)),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 8),
                      ),
                      child: Slider(
                        min: 0,
                        max: value.totalDuration.inSeconds.toDouble(),
                        value: value.currentDuration.inSeconds.toDouble(),
                        activeColor: Colors.green,
                        onChanged: (double double) {
                          //! during when the user is sliding around
                        },
                        onChangeEnd: (double double) {
                          //! sliding has finished, to to the positon in song duration
                          value.seek(Duration(seconds: double.toInt()));

                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //! playback controls
                Row(
                  children: [
                    //! skip preview
                    Expanded(
                        child: GestureDetector(
                          onTap: value.playPreviousSong,
                            child:const NeuBox(child: Icon(Icons.skip_previous)))),
                            const SizedBox(width: 10,),
                    //! play pause
                 Expanded(
                  flex: 2,
                        child: GestureDetector(
                          onTap:value.pauseOrResume,
                            child: NeuBox(child: Icon(value.isPlaying ? Icons.pause: Icons.play_arrow)))),
                            const SizedBox(width: 10,),

                    //! skip forward
                    Expanded(
                        child: GestureDetector(
                          onTap:value.playNextSong,
                            child: NeuBox(child: Icon(Icons.skip_next)))),
                  ],
                )
              ],
            ),
          ),
        ),
      );
      }
    );
  }
}
