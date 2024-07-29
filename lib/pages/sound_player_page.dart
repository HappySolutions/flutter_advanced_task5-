import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:carousel_slider_app/widgets/sound_player.dart';
import 'package:flutter/material.dart';

class SoundPlayerPage extends StatefulWidget {
  final Audio audioFile;

  const SoundPlayerPage({required this.audioFile, super.key});

  @override
  State<SoundPlayerPage> createState() => _SoundPlayerPageState();
}

class _SoundPlayerPageState extends State<SoundPlayerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SoundPlayerWidget(
          audioFile: widget.audioFile,
        ),
      ),
    );
  }
}
