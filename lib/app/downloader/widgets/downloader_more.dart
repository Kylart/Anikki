import 'package:flutter/material.dart';

class DownloaderMore extends StatefulWidget {
  const DownloaderMore({
    super.key,
    required this.onChanged,
  });

  final void Function(String? value) onChanged;

  @override
  State<DownloaderMore> createState() => _DownloaderMoreState();
}

class _DownloaderMoreState extends State<DownloaderMore> {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      widget.onChanged(_controller.value.text);
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
            icon: const Icon(Icons.clear),
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
