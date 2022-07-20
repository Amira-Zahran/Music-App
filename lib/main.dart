import 'dart:collection';

//import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_app/APIs/Tracks-Model.dart';

import 'APIs/BLoC.dart';

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
  BLoC bLoC = BLoC();

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
                return CarouselSlider(
                  options: CarouselOptions(height: 380, autoPlay: true,scrollDirection: Axis.vertical,viewportFraction: 0.32,),
                  items: snapshot.data!.where((element) => element.track!.instrumental == 0 ).map((e) =>
                      Padding(
                        padding: const EdgeInsets.only(top: 20, left: 60.0, right: 60),
                        child: SizedBox(
                          width: 250, height: 70,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child:
                            //e.type!.split('').first}T' : e.type!.split('').first'${e.type!.split('').first}T' : e.type!.split('').first}
                            //e.type!.contains('TakeAway') ? Icon(Icons.fastfood, color: Color.fromRGBO(14, 35, 46, 1),) : Icon(Icons.baby_changing_station),
                            Center(
                              child: Text(
                                 '${e.track!.trackName}',
                                /*'Din in'' ${e.orderId}',*/
                                //'${e.type!.contains('Floor') ? '${e.type!.split('Din-in')}' : e.type!.split('TakeAway')} ${e.orderId}',
                                style: const TextStyle(
                                  fontSize: 33,
                                  fontWeight: FontWeight
                                      .bold,
                                  color: Color.fromRGBO(
                                      249, 183, 0, 1),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10),
                              color: Color.fromRGBO(
                                  14, 35, 46, 1),
                            ),
                          ),
                        ),)).toList(),
                );
              })
          ),
        ],
        ),
      ),
    );
  }
}
