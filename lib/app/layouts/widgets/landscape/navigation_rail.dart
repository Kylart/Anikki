import 'package:cached_network_image/cached_network_image.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:simple_icons/simple_icons.dart';

import 'package:anikki/app/anilist_auth/bloc/anilist_auth_bloc.dart';
import 'package:anikki/app/anilist_auth/shared/helpers/login.dart';
import 'package:anikki/app/anilist_auth/shared/helpers/logout.dart';
import 'package:anikki/app/layouts/shared/helpers/helpers.dart';
import 'package:anikki/core/core.dart';

part 'navigation_rail_item.dart';

class AnikkiNavigationRail extends StatefulWidget {
  const AnikkiNavigationRail({
    super.key,
    required this.pages,
    required this.onPageChanged,
    required this.currentIndex,
    this.connected = false,
  });

  final List<AnikkiPage> pages;
  final void Function(int index) onPageChanged;
  final int currentIndex;
  final bool connected;

  @override
  State<AnikkiNavigationRail> createState() => _AnikkiNavigationRailState();
}

class _AnikkiNavigationRailState extends State<AnikkiNavigationRail> {
  final expandedWidth = 250.0;
  final nonExpandedWidth = 70.0;

  bool expanded = false;

  Widget get gap => const SizedBox(
        height: 24.0,
      );

  _NavigationRailItem get titleItem => _NavigationRailItem(
        expanded: expanded,
        text: 'Anikki',
        imageUrl: 'assets/logo.png',
        isTitle: true,
      );

  Iterable<_NavigationRailItem> get pages => widget.pages.mapIndexed(
        (index, page) => _NavigationRailItem(
          expanded: expanded,
          text: page.name,
          selected: index == widget.currentIndex,
          icon: index == widget.currentIndex ? page.selectedIcon : page.icon,
          onClick: () {
            widget.onPageChanged(index);
          },
        ),
      );

  List<_NavigationRailItem> get actionItems => [
        _NavigationRailItem(
          expanded: expanded,
          icon: HugeIcons.strokeRoundedSearch01,
          text: 'Search',
          onClick: Scaffold.of(context).openDrawer,
        ),
        _NavigationRailItem(
          expanded: expanded,
          icon: HugeIcons.strokeRoundedCalendar03,
          text: 'Agenda',
        ),
        _NavigationRailItem(
          expanded: expanded,
          icon: HugeIcons.strokeRoundedClock04,
          text: 'History',
        ),
      ];

  List<_NavigationRailItem> get externalLinkItems => [
        _NavigationRailItem(
          expanded: expanded,
          icon: SimpleIcons.anilist,
          text: 'Go to AniList',
          onClick: () => openInBrowser('https://anilist.co'),
        ),
        _NavigationRailItem(
          expanded: expanded,
          icon: SimpleIcons.myanimelist,
          text: 'Go to MyAnimeList',
          onClick: () => openInBrowser('https://myanimelist.net'),
        ),
        _NavigationRailItem(
          expanded: expanded,
          icon: SimpleIcons.themoviedatabase,
          text: 'Go to TMDB',
          onClick: () => openInBrowser('https://www.themoviedb.org/'),
        ),
      ];

  List<Widget> makeAccountItems(BuildContext context) => [
        BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
          builder: (context, state) => state is AnilistAuthSuccess
              ? _NavigationRailItem(
                  expanded: expanded,
                  icon: HugeIcons.strokeRoundedLogout02,
                  text: 'Logout',
                  onClick: () => logoutFromAnilist(context),
                )
              : const SizedBox(),
        ),
        BlocBuilder<AnilistAuthBloc, AnilistAuthState>(
          builder: (context, state) => state is AnilistAuthSuccess
              ? _NavigationRailItem(
                  expanded: expanded,
                  imageUrl: state.me.avatar?.large ?? state.me.avatar?.medium,
                  text: state.me.name,
                )
              : _NavigationRailItem(
                  expanded: expanded,
                  icon: SimpleIcons.anilist,
                  text: 'Login with Anilist',
                  onClick: () => loginToAnilist(context),
                ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() {
        expanded = true;
      }),
      onHover: (event) => setState(() {
        expanded = true;
      }),
      onExit: (event) => setState(() {
        expanded = false;
      }),
      child: AnimatedContainer(
        duration: 200.ms,
        width: expanded ? expandedWidth : nonExpandedWidth,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32.0),
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Container(
                width: double.infinity,
                constraints: constraints.copyWith(
                  minHeight: constraints.maxHeight,
                  maxHeight: double.infinity,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          titleItem,
                          gap,
                          ...pages,
                          gap,
                          ...actionItems,
                          gap,
                          ...externalLinkItems,
                          gap,
                        ],
                      ),
                      Column(
                        children: makeAccountItems(context),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
