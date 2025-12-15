import 'package:flutter/material.dart';
import '../models/song.dart';

class MusicProvider with ChangeNotifier {
  // Mock Data
  final List<Song> _playlist = [
    Song(
      id: '1',
      title: 'Midnight City',
      artist: 'M83',
      album: 'Hurry Up, We\'re Dreaming',
      coverUrl: 'https://picsum.photos/id/10/400/400',
      duration: const Duration(minutes: 4, seconds: 3),
    ),
    Song(
      id: '2',
      title: 'Starboy',
      artist: 'The Weeknd',
      album: 'Starboy',
      coverUrl: 'https://picsum.photos/id/20/400/400',
      duration: const Duration(minutes: 3, seconds: 50),
    ),
    Song(
      id: '3',
      title: 'Get Lucky',
      artist: 'Daft Punk',
      album: 'Random Access Memories',
      coverUrl: 'https://picsum.photos/id/30/400/400',
      duration: const Duration(minutes: 6, seconds: 9),
    ),
    Song(
      id: '4',
      title: 'Nightcall',
      artist: 'Kavinsky',
      album: 'OutRun',
      coverUrl: 'https://picsum.photos/id/40/400/400',
      duration: const Duration(minutes: 4, seconds: 18),
    ),
    Song(
      id: '5',
      title: 'Instant Crush',
      artist: 'Daft Punk',
      album: 'Random Access Memories',
      coverUrl: 'https://picsum.photos/id/50/400/400',
      duration: const Duration(minutes: 5, seconds: 37),
    ),
  ];

  Song? _currentSong;
  bool _isPlaying = false;
  Duration _currentPosition = Duration.zero;

  List<Song> get playlist => _playlist;
  Song? get currentSong => _currentSong;
  bool get isPlaying => _isPlaying;
  Duration get currentPosition => _currentPosition;

  void play(Song song) {
    _currentSong = song;
    _isPlaying = true;
    _currentPosition = Duration.zero; // Reset for demo
    notifyListeners();
  }

  void togglePlayPause() {
    if (_currentSong != null) {
      _isPlaying = !_isPlaying;
      notifyListeners();
    }
  }

  void next() {
    if (_currentSong == null) return;
    final currentIndex = _playlist.indexOf(_currentSong!);
    if (currentIndex < _playlist.length - 1) {
      play(_playlist[currentIndex + 1]);
    } else {
      play(_playlist[0]); // Loop back to start
    }
  }

  void previous() {
    if (_currentSong == null) return;
    final currentIndex = _playlist.indexOf(_currentSong!);
    if (currentIndex > 0) {
      play(_playlist[currentIndex - 1]);
    } else {
      play(_playlist.last); // Loop to end
    }
  }
  
  void seek(Duration position) {
    _currentPosition = position;
    notifyListeners();
  }
}
