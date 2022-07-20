/*
ListView(
children: [
Column(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: snapshot.data!.map((e) =>
Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
children: [
const Icon(Icons.music_note),
Text('${e.track!.trackName}'),
Text('${e.track!.artistName}'),
],),
).toList(),
),
],
);
*/
//f