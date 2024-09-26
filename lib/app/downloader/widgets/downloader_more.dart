import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'package:anikki/app/downloader/bloc/downloader_bloc.dart';

class DownloaderMore extends StatefulWidget {
  const DownloaderMore({
    super.key,
  });

  @override
  State<DownloaderMore> createState() => _DownloaderMoreState();
}

class _DownloaderMoreState extends State<DownloaderMore> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      final bloc = BlocProvider.of<DownloaderBloc>(context);

      bloc.add(
        DownloaderFiltered(
          bloc.filter.copyWith(
            more: _controller.value.text,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 12.0),
          hintText: 'Anything to refine?',
          fillColor: Colors.transparent,
          hoverColor: Colors.transparent,
          suffixIcon: IconButton(
            onPressed: _controller.clear,
            icon: const Icon(HugeIcons.strokeRoundedCancel01),
          ),
        ),
        style: const TextStyle(
          fontSize: 14,
        ),
        // onChanged: widget.onChanged,
      ),
    );
  }
}
