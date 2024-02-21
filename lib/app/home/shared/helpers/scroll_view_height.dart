import 'package:flutter/material.dart';

const kHomeScrollViewPaddingValue = 18.0;

double getScrollViewHeight(
  BuildContext context,
) {
  return (MediaQuery.of(context).size.height < 1000 ? 250.0 : 300.0) +
      kHomeScrollViewPaddingValue * 2;
}
