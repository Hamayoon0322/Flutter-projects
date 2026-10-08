import 'package:flutter/material.dart';

import '../models/xylophone_note.dart';
import '../services/xylophone_audio_service.dart';
import '../widgets/mallet.dart';
import '../widgets/xylophone_bar.dart';

class XylophoneScreen extends StatefulWidget {
  const XylophoneScreen({super.key});

  @override
  State<XylophoneScreen> createState() => _XylophoneScreenState();
}

class _XylophoneScreenState extends State<XylophoneScreen> {
  final XylophoneAudioService _audioService = XylophoneAudioService();
  bool _audioReady = false;

  @override
  void initState() {
    super.initState();
    _prepareAudio();
  }

  Future<void> _prepareAudio() async {
    try {
      await _audioService.initialize();
      if (mounted) {
        setState(() => _audioReady = true);
      }
    } catch (_) {
      // Visual interaction remains available if audio is unavailable.
    }
  }

  @override
  void dispose() {
    _audioService.dispose();
    super.dispose();
  }

  Future<void> _play(XylophoneNote note) {
    return _audioReady ? _audioService.playNote(note) : Future<void>.value();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF9F1E4), Color(0xFFEAD3B5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isLandscape = constraints.maxWidth > constraints.maxHeight;
              return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 20,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 40,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'XYLOPHONE',
                        style: TextStyle(
                          color: Color(0xFF75452F),
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 4,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        'tap the bars to make music',
                        style: TextStyle(
                          color: const Color(0xFF75452F).withValues(alpha: .72),
                          fontSize: 14,
                          letterSpacing: 1.1,
                        ),
                      ),
                      SizedBox(height: isLandscape ? 12 : 30),
                      _Instrument(compact: isLandscape, onPlay: _play),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class _Instrument extends StatelessWidget {
  const _Instrument({required this.compact, required this.onPlay});

  final bool compact;
  final ValueChanged<XylophoneNote> onPlay;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth.clamp(280.0, 720.0).toDouble();
        final barWidth = width - 32;
        final barHeight = (barWidth / 11).clamp(29.0, 55.0).toDouble();
        final gap = (barHeight * .18).clamp(5.0, 9.0).toDouble();
        final frameHeight = barHeight * 10 + gap * 9 + 56;

        return SizedBox(
          width: width,
          height: frameHeight + 175,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: 28,
                left: 2,
                right: 2,
                height: frameHeight,
                child: _WoodenFrame(
                  child: _Bars(
                    barWidth: barWidth,
                    barHeight: barHeight,
                    gap: gap,
                    onPlay: onPlay,
                  ),
                ),
              ),
              Positioned(
                bottom: compact ? 2 : 12,
                left: width * .12,
                child: const Mallet(rotation: -.27),
              ),
              Positioned(
                bottom: compact ? 2 : 12,
                right: width * .12,
                child: const Mallet(rotation: .27),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Bars extends StatelessWidget {
  const _Bars({
    required this.barWidth,
    required this.barHeight,
    required this.gap,
    required this.onPlay,
  });

  final double barWidth;
  final double barHeight;
  final double gap;
  final ValueChanged<XylophoneNote> onPlay;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var index = 0; index < XylophoneNote.values.length; index++) ...[
          Align(
            alignment: Alignment.centerLeft,
            child: Transform.rotate(
              angle: -.018,
              alignment: Alignment.centerLeft,
              child: XylophoneBar(
                note: XylophoneNote.values[index],
                width: barWidth * (1 - index * .055),
                height: barHeight,
                onTap: () => onPlay(XylophoneNote.values[index]),
              ),
            ),
          ),
          if (index < XylophoneNote.values.length - 1) SizedBox(height: gap),
        ],
      ],
    );
  }
}

class _WoodenFrame extends StatelessWidget {
  const _WoodenFrame({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        gradient: const LinearGradient(
          colors: [Color(0xFFC17B48), Color(0xFF784126)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x552F1A10),
            blurRadius: 14,
            offset: Offset(3, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 28),
        child: child,
      ),
    );
  }
}
