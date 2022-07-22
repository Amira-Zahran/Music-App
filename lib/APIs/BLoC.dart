import 'dart:async';
import 'dart:collection';

import 'package:http/http.dart';
import 'dart:convert';
import 'package:rxdart/rxdart.dart';
import 'API_helper.dart';
import 'Tracks-Model.dart';




class BLoC {

  late Timer time;

  List<TrackList> _tracks = [];

  final _tracksSubject = BehaviorSubject<UnmodifiableListView<TrackList>>();

  Stream<UnmodifiableListView<TrackList>> get TracksStream => _tracksSubject.stream;

  Future<Null> getTracks({String? query}) async {

    Response response = await get(Uri.parse(API.apikey),);
    print(response.body);
    Map<String, dynamic> data = json.decode(response.body);
    _tracks =
        (data['track_list'] as List).map((v) => TrackList.fromJson(v)).toList();
    if(query != null){
      _tracks = _tracks.where((element) => element.track!.trackId!.toString().contains(query.toLowerCase())).toList();
    }

    _tracksSubject.add(UnmodifiableListView(_tracks));

//    return trackId;
  }



  BLoC() {
    time = Timer.periodic(Duration(seconds: 5), (timer) {
      getTracks();
    });
  }
}
