part of 'home_scroll_view.dart';

class _HomeScrollViewLoader extends StatelessWidget {
  const _HomeScrollViewLoader();

  @override
  Widget build(BuildContext context) {
    return HomeScrollView(
      children: List.generate(
        10,
        (index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.7),
            highlightColor: Colors.white70,
            child: Container(
              height: 290,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: const AspectRatio(
                aspectRatio: 11 / 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
