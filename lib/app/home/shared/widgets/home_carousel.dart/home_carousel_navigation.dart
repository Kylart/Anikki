part of 'home_carousel.dart';

class _HomeCarouselNavigation extends StatelessWidget {
  const _HomeCarouselNavigation({
    required this.text,
    required this.onNext,
    required this.onPrevious,
  });

  final String text;
  final void Function() onNext;
  final void Function() onPrevious;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onPrevious,
          icon: const Icon(HugeIcons.strokeRoundedArrowLeft01),
        ),
        Text(text),
        IconButton(
          onPressed: onNext,
          icon: const Icon(HugeIcons.strokeRoundedArrowRight01),
        ),
      ],
    );
  }
}
