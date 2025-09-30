import 'dart:async';
import 'package:coptic_hymns_school/views/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FadeCarousel extends ConsumerStatefulWidget {
  final List<String> images;
  final Duration duration;
  final double height;

  final bool showIndicators;

  final bool enableSwipe;

  final bool autoPlay;

  const FadeCarousel({
    super.key,
    required this.images,
    required this.height,
    this.duration = const Duration(seconds: 3),
    this.showIndicators = false,
    this.enableSwipe = true,
    this.autoPlay = true,
  });

  @override
  ConsumerState<FadeCarousel> createState() => _FadeCarouselState();
}


class _FadeCarouselState extends ConsumerState<FadeCarousel> {
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  void _startAutoPlay() {
    _timer?.cancel();
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.images.length;
      });
    });
  }

  void _onSwipe(DragEndDetails details) {
    if (!widget.enableSwipe) return;

    setState(() {
      if (details.primaryVelocity! < 0) {
        // swipe left
        _currentIndex = (_currentIndex + 1) % widget.images.length;
      } else if (details.primaryVelocity! > 0) {
        // swipe right
        _currentIndex =
            (_currentIndex - 1 + widget.images.length) % widget.images.length;
      }
    });

    if (widget.autoPlay) {
      _startAutoPlay();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final color=ref.watch(primaryColorProvider);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        GestureDetector(
          onHorizontalDragEnd: widget.enableSwipe ? _onSwipe : null,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: AnimatedSwitcher(
              duration: const Duration(seconds: 1),
              child: Image.network(
                widget.images[_currentIndex],
                key: ValueKey<int>(_currentIndex),
                fit: BoxFit.cover,
                height: widget.height,
                width: double.infinity,
              ),
            ),
          ),
        ),
        if (widget.showIndicators)
          Positioned(
            bottom: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  widget.images.length,
                      (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    width: _currentIndex == index ? 16.0 : 8.0,
                    height: 8.0,
                    decoration: BoxDecoration(
                      color: _currentIndex == index
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
