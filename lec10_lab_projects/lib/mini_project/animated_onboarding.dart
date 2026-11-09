import 'package:flutter/material.dart';

class AnimatedOnboardingPage extends StatefulWidget {
  const AnimatedOnboardingPage({super.key});

  @override
  State<AnimatedOnboardingPage> createState() => _AnimatedOnboardingPageState();
}

class _AnimatedOnboardingPageState extends State<AnimatedOnboardingPage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _logoScale;
  late final Animation<double> _titleFade;
  late final Animation<Offset> _descriptionSlide;
  late final Animation<double> _buttonFade;
  late final Animation<double> _buttonScale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2400),
    );
    _logoScale = Tween<double>(begin: 0.55, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.38, curve: Curves.elasticOut),
      ),
    );
    _titleFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.22, 0.58, curve: Curves.easeIn),
    );
    _descriptionSlide = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.42, 0.78, curve: Curves.easeOutCubic),
      ),
    );
    _buttonFade = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.72, 1, curve: Curves.easeIn),
    );
    _buttonScale = Tween<double>(begin: 0.85, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.72, 1, curve: Curves.easeOutBack),
      ),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _continue() {
    if (!_controller.isCompleted) return;
    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(builder: (_) => const OnboardingCompletePage()),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('Animated Onboarding')),
    body: SafeArea(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleTransition(
                scale: _logoScale,
                child: const Hero(
                  tag: 'onboarding-logo',
                  child: CircleAvatar(
                    radius: 48,
                    child: Icon(Icons.flutter_dash, size: 56),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              FadeTransition(
                opacity: _titleFade,
                child: Text(
                  'A brighter way to learn',
                  style: Theme.of(context).textTheme.headlineSmall,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              SlideTransition(
                position: _descriptionSlide,
                child: const Text(
                  'Explore lessons, track your progress, and build something '
                  'great one step at a time.',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 28),
              FadeTransition(
                opacity: _buttonFade,
                child: ScaleTransition(
                  scale: _buttonScale,
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) => IgnorePointer(
                      ignoring: !_controller.isCompleted,
                      child: child,
                    ),
                    child: FilledButton.icon(
                      onPressed: _continue,
                      icon: const Icon(Icons.arrow_forward),
                      label: const Text('Continue'),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton.icon(
                onPressed: () => _controller.forward(from: 0),
                icon: const Icon(Icons.replay),
                label: const Text('Replay animation'),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class OnboardingCompletePage extends StatelessWidget {
  const OnboardingCompletePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('You are ready')),
    body: Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Hero(
              tag: 'onboarding-logo',
              child: CircleAvatar(
                radius: 48,
                child: Icon(Icons.flutter_dash, size: 56),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Let’s get started!',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 12),
            const Text(
              'The onboarding sequence is complete. Use Back to replay it.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ),
  );
}
