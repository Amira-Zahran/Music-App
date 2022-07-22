import 'dart:collection';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:music_app/APIs/Tracks-Model.dart';
import 'package:music_app/TrackDetails.dart';

import 'APIs/Global.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Music App',

      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Center(child: Text('My Playlist',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
        )),
        elevation: 5,
      ),
      body: Expanded(
        child: Column(children: [
          const SizedBox(height: 10,),
          Center(child: StreamBuilder<UnmodifiableListView<TrackList>>(
              stream: bLoC.TracksStream,
              builder: (context, snapshot) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: snapshot.data!.map((e) =>
                  GestureDetector(
                    onTap: (){
                      currentTrack = e.track!.trackId as Track;
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> const TrackDetails()));
                    },
                    child: ConditionalBuilder(
                      condition: snapshot.data != null,
                      builder: (BuildContext context) {
                        return Row(
                          children: [
                            const Icon(Icons.music_note),
                            Text('${e.track!.trackName}'),
                            Text('${e.track!.artistName}'),
                          ],
                        );
                      }, fallback: (BuildContext context) { return const Center(child: Text('NO INTERNET CONNECTION', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),); },
                    ),
                  ),
                  ).toList(),
                );
              })
          ),
        ],
        ),
      ),
    );
  }
}
