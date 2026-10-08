import 'package:flutter/material.dart';

import '../models/xylophone_note.dart';

class XylophoneBar extends StatefulWidget {
  const XylophoneBar({
    super.key,
    required this.note,
    required this.width,
    required this.height,
    required this.onTap,
  });

  final XylophoneNote note;
  final double width;
  final double height;
  final VoidCallback onTap;

  @override
  State<XylophoneBar> createState() => _XylophoneBarState();
}

class _XylophoneBarState extends State<XylophoneBar>
    with SingleTickerProviderStateMixin {
  late final AnimationController _pressController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 90),
    reverseDuration: const Duration(milliseconds: 180),
    lowerBound: 0,
    upperBound: 1,
  );

  @override
  void dispose() {
    _pressController.dispose();
    super.dispose();
  }

  void _handleTap() {
    widget.onTap();
    _pressController.forward(from: 0).then((_) => _pressController.reverse());
  }

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Xylophone ${widget.note.label}',
      child: GestureDetector(
        onTap: _handleTap,
        child: AnimatedBuilder(
          animation: _pressController,
          builder: (context, child) {
            final offset = 4 * _pressController.value;
            return Transform.translate(offset: Offset(0, offset), child: child);
          },
          child: Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.height * .22),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.lerp(widget.note.color, Colors.white, .3)!,
                  widget.note.color,
                  Color.lerp(widget.note.color, Colors.black, .18)!,
                ],
                stops: const [0, .42, 1],
              ),
              border: Border.all(
                color: Color.lerp(widget.note.color, Colors.white, .45)!,
                width: 1.5,
              ),
              boxShadow: const [
                BoxShadow(
                  color: Color(0x550B1721),
                  blurRadius: 8,
                  offset: Offset(2, 5),
                ),
              ],
            ),
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Text(
                  widget.note.label.substring(0, 1),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .78),
                    fontSize: widget.height * .34,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
