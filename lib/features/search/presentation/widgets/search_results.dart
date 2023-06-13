import 'package:flutter/material.dart';

import 'package:anikki/features/downloader/presentation/widgets/torrents_list.dart';
import 'package:anikki/features/library/presentation/widgets/library_layout.dart';
import 'package:anikki/features/search/presentation/bloc/search_bloc.dart';
import 'package:anikki/core/helpers/open_in_browser.dart';
import 'package:anikki/core/widgets/entry/entry_tile.dart';

class SearchResults extends StatefulWidget {
  const SearchResults({
    super.key,
    required this.state,
  });

  final SearchSuccess state;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<Tab> tabs;

  @override
  void initState() {
    super.initState();

    tabs = [
      if (widget.state.medias != null && widget.state.medias!.isNotEmpty)
        const Tab(
          text: 'Animes',
        ),
      if (widget.state.torrents != null && widget.state.torrents!.isNotEmpty)
        const Tab(
          text: 'Torrents',
        ),
      if (widget.state.libraryEntries != null &&
          widget.state.libraryEntries!.isNotEmpty)
        const Tab(
          text: 'Local files',
        ),
      if (widget.state.staffs != null && widget.state.staffs!.isNotEmpty)
        const Tab(
          text: 'Staff',
        ),
      if (widget.state.characters != null &&
          widget.state.characters!.isNotEmpty)
        const Tab(
          text: 'Characters',
        ),
    ];

    controller = TabController(
      vsync: this,
      length: tabs.length,
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
      mainAxisSize: MainAxisSize.min,
      children: [
        TabBar(
          isScrollable: MediaQuery.of(context).size.width < 600,
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorWeight: 1.0,
          splashBorderRadius: const BorderRadius.all(Radius.circular(40)),
          controller: controller,
          tabs: tabs,
        ),
        Expanded(
          child: TabBarView(
            controller: controller,
            children: [
              if (widget.state.medias != null &&
                  widget.state.medias!.isNotEmpty)
                ListView(
                  children: widget.state.medias!
                      .map(
                        (e) => EntryTile(
                          media: e,
                          heroTag: 'search-${e.id}',
                        ),
                      )
                      .toList(),
                ),
              if (widget.state.torrents != null &&
                  widget.state.torrents!.isNotEmpty)
                TorrentsList(
                  torrents: widget.state.torrents!,
                ),
              if (widget.state.libraryEntries != null &&
                  widget.state.libraryEntries!.isNotEmpty)
                LibraryLayout(
                  entries: widget.state.libraryEntries!,
                ),
              if (widget.state.staffs != null &&
                  widget.state.staffs!.isNotEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.state.staffs!.length,
                  itemBuilder: (context, index) {
                    final item = widget.state.staffs![index];

                    return ListTile(
                      title: Text(item.name?.full ?? 'N/A'),
                      subtitle: const Text(''),
                      onTap: () => openInBrowser(item.siteUrl),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            item.image?.large ?? item.image?.medium ?? ''),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                ),
              if (widget.state.characters != null &&
                  widget.state.characters!.isNotEmpty)
                ListView.separated(
                  shrinkWrap: true,
                  itemCount: widget.state.characters!.length,
                  itemBuilder: (context, index) {
                    final item = widget.state.characters![index];

                    return ListTile(
                      title: Text(item.name?.full ?? 'N/A'),
                      subtitle: const Text(''),
                      onTap: () => openInBrowser(item.siteUrl),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            item.image?.large ?? item.image?.medium ?? ''),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
