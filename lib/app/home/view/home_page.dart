import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/app/home/widgets/background_image.dart';
import 'package:anikki/app/home/widgets/home_carousel.dart/home_carousel.dart';
import 'package:anikki/app/home/widgets/home_loader.dart';
import 'package:anikki/app/home/widgets/home_side_menu.dart';
import 'package:anikki/app/home/widgets/home_title/home_title.dart';
import 'package:anikki/core/widgets/error_widget.dart';

part 'home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WatchListBloc, WatchListState>(
      builder: (context, state) {
        return _HomeView(
          isWatchListLoading: state is WatchListLoading,
        );
      },
    );
  }
}
