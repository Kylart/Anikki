part of 'home_scroll_view.dart';

class HomeScrollViewLoader extends StatelessWidget {
  const HomeScrollViewLoader({
    super.key,
    this.scrollController,
  });

  final ScrollController? scrollController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          10,
          (index) => const HomeScrollViewLoaderTile(),
        ),
      ),
    );
  }
}
