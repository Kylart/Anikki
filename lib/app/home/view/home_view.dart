part of 'home_page.dart';

class _HomeView extends StatelessWidget {
  const _HomeView({
    required this.isWatchListLoading,
  });

  final bool isWatchListLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutBloc, LayoutState>(
      builder: (context, state) => switch (state) {
        LayoutLandscape() => HomeViewLandscape(
            isWatchListLoading: isWatchListLoading,
          ),
        LayoutPortrait() => HomeViewPortrait(
            isWatchListLoading: isWatchListLoading,
          ),
      },
    );
  }
}
