import 'dart:ui';

import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 700,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(40)),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: TextFormField(
            textAlign: TextAlign.center,
            decoration: const InputDecoration(
              fillColor: Colors.transparent,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              suffixIcon: Icon(Icons.search),
              hintText: 'Looking for something?',
            ),
          ),
        ),
      ),
    );
  }
}
