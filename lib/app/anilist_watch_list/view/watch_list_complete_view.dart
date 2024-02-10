part of 'watch_list_view.dart';

class _WatchListCompleteView extends StatefulWidget {
  const _WatchListCompleteView(this.state);

  final WatchListComplete state;

  @override
  State<_WatchListCompleteView> createState() => _WatchListCompleteViewState();
}

class _WatchListCompleteViewState extends State<_WatchListCompleteView>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      vsync: this,
      length: Enum$MediaListStatus.values.length - 1,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: MediaQuery.of(context).size.width < 600,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1.0,
          splashBorderRadius: const BorderRadius.all(Radius.circular(40)),
          tabs: Enum$MediaListStatus.values
              .where((element) => element.name != '\$unknown')
              .map(
                (e) => Tab(
                  text: e.name.capitalize(),
                ),
              )
              .toList(),
          controller: controller,
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: Enum$MediaListStatus.values
                .where((element) => element.name != '\$unknown')
                .map(
              (status) {
                final watchList = widget.state.watchList;
                final entries = switch (status) {
                  Enum$MediaListStatus.CURRENT => watchList.current,
                  Enum$MediaListStatus.PLANNING => watchList.planning,
                  Enum$MediaListStatus.COMPLETED => watchList.completed,
                  Enum$MediaListStatus.DROPPED => watchList.dropped,
                  Enum$MediaListStatus.PAUSED => watchList.paused,
                  Enum$MediaListStatus.REPEATING => watchList.repeating,
                  Enum$MediaListStatus.$unknown =>
                    List<AnilistWatchListEntry>.empty(),
                };

                return WatchListLayout(
                  entries: entries,
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
