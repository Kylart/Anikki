part of 'home_scroll_view.dart';

class _HomeScrollViewLoader extends StatelessWidget {
  const _HomeScrollViewLoader();

  @override
  Widget build(BuildContext context) {
    return HomeScrollView(
      children: List.generate(
        10,
        (index) => const LoaderTile(),
      ),
    );
  }
}
