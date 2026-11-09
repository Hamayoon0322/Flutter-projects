# Lecture 10 Lab Projects

Flutter animation examples for five practical labs and an animated onboarding
mini project. Run the app and choose a demo from the home screen.

## Practical labs

1. **AnimatedContainer** - toggles a square's size, color, and corner radius.
   Quick and relaxed duration options demonstrate how timing changes the feel:
   quick motion is responsive, while slower motion makes the transition easier
   to observe but can feel sluggish when repeated.
2. **Opacity & CrossFade** - fades a profile panel and switches between locked
   and unlocked content. The opacity example keeps its layout space even while
   transparent.
3. **AnimationController + Tween** - scales an icon between 0.8 and 1.2 through
   a `CurvedAnimation` and `ScaleTransition`; the controller is disposed with
   the widget.
4. **AnimatedBuilder** - rotates a static icon through one turn. Forward,
   Reverse, Repeat, and Stop controls demonstrate the controller lifecycle.
5. **Staggered Animation** - combines fade, slide, and scale transitions from
   one controller using overlapping `Interval` ranges.

## Animated Onboarding mini project

The onboarding screen uses one 2.4-second controller for a logo scale, title
fade, descriptive-text slide, and a final Continue-button fade/scale. The
sequence begins on entry, can be replayed, and Continue opens a second screen
after the sequence completes. The shared logo uses a `Hero` transition.

Run checks from this folder:

```sh
flutter analyze
flutter test
```
