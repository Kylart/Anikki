import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 72,
      width: MediaQuery.of(context).size.width * 0.4,
      child: Center(
        child: Container(
          constraints: const BoxConstraints(
            minWidth: 400,
            maxWidth: 700,
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Search anything',
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
      ),
    );
  }
}
