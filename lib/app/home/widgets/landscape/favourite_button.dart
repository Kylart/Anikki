import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/anilist_watch_list/bloc/watch_list_bloc.dart';
import 'package:anikki/app/home/bloc/home_bloc.dart';
import 'package:anikki/core/core.dart';

class FavouriteButton extends StatefulWidget {
  const FavouriteButton({
    super.key,
    required this.media,
  });

  final Media media;

  @override
  State<FavouriteButton> createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  bool get isFavourite => widget.media.anilistInfo.isFavourite == true;

  bool _isToggleFavouriteLoading = false;

  bool get isToggleFavouriteLoading => _isToggleFavouriteLoading;

  set isToggleFavouriteLoading(bool value) {
    setState(() {
      _isToggleFavouriteLoading = value;
    });
  }

  Widget _buildLoader(BuildContext context) => Container(
        padding: const EdgeInsets.all(2.0),
        width: 24,
        height: 24,
        child: CircularProgressIndicator(
          color: context.colorScheme.onPrimary,
          strokeWidth: 2.0,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (isToggleFavouriteLoading && state is HomeLoaded) {
          isToggleFavouriteLoading = false;
        }
      },
      child: Tooltip(
        message: isFavourite ? 'Remove from favourite' : 'Add to favourite',
        child: IconButton.filled(
          onPressed: () {
            if (isToggleFavouriteLoading) return;

            isToggleFavouriteLoading = true;

            BlocProvider.of<WatchListBloc>(context).add(
              WatchListToggleFavourite(
                mediaId: widget.media.anilistInfo.id,
              ),
            );
          },
          icon: AnimatedCrossFade(
            firstChild: _buildLoader(context),
            secondChild: Icon(
              isFavourite ? Icons.favorite : HugeIcons.strokeRoundedFavourite,
              color: isFavourite ? Colors.red : null,
            ),
            crossFadeState: isToggleFavouriteLoading
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 200),
          ),
        ),
      ),
    );
  }
}
