import 'package:audioplayers/audioplayers.dart';

import '../models/xylophone_note.dart';

class XylophoneAudioService {
  final Map<XylophoneNote, AudioPlayer> _players = {};

  Future<void> initialize() async {
    await Future.wait(
      XylophoneNote.values.map((note) async {
        final player = AudioPlayer();
        await player.setReleaseMode(ReleaseMode.stop);
        await player.setSource(
          AssetSource(note.assetPath.replaceFirst('assets/', '')),
        );
        _players[note] = player;
      }),
    );
  }

  Future<void> playNote(XylophoneNote note) async {
    final player = _players[note];
    if (player == null) {
      return;
    }
    await player.stop();
    await player.resume();
  }

  Future<void> dispose() async {
    await Future.wait(_players.values.map((player) => player.dispose()));
    _players.clear();
  }
}
