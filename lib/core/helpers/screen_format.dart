import 'package:flutter/material.dart';

const breakpoint = 800;

bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).size.width <= breakpoint;
}

bool isLandscape(BuildContext context) {
  return MediaQuery.of(context).size.width > breakpoint;
}
