import 'dart:collection';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:music_app/APIs/Tracks-Model.dart';

import 'APIs/Global.dart';

class TrackDetails extends StatefulWidget {
  const TrackDetails({Key? key}) : super(key: key);

  @override
  State<TrackDetails> createState() => _TrackDetailsState();
}

class _TrackDetailsState extends State<TrackDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(
          child: Text(
            'Track Details',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 15.0),
        child: Center(
          child: StreamBuilder<UnmodifiableListView<TrackList>>(
              stream: bLoC.TracksStream,
              initialData: UnmodifiableListView<TrackList>([]),
              builder: (context, snapshot) {
                return ConditionalBuilder(
                  condition: snapshot.data != null,
                  builder: (BuildContext context) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(249, 183, 0, 1),
                                ),
                              ),
                              Text(
                                '${currentTrack.trackName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Artist',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color.fromRGBO(
                                      249, 183, 0, 1),
                                ),
                              ),
                              Text(
                                '${currentTrack.artistName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Album Name',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color.fromRGBO(
                                      249, 183, 0, 1),
                                ),
                              ),
                              Text(
                                '${currentTrack.albumName}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Explicit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color.fromRGBO(
                                      249, 183, 0, 1),
                                ),
                              ),
                              Text(
                                '${currentTrack.explicit}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Rating',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color.fromRGBO(
                                      249, 183, 0, 1),
                                ),
                              ),
                              Text(
                                currentTrack.trackRating.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const Text(
                                'Lyrics',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                  fontFamily: 'Cairo_Regular',
                                  color: Color.fromRGBO(
                                      249, 183, 0, 1),
                                ),
                              ),
                              Text(
                                currentTrack.hasLyrics.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                    fontFamily: 'Cairo_Regular',
                                    color: Colors.black
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }, fallback: (BuildContext context) {
                    return const Center(child: Text('NO INTERNET CONNECTION', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),); },
                );
              }),
        ),
      ),
    );
  }
}
