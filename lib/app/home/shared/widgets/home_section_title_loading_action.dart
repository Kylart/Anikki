import 'package:flutter/material.dart';

class HomeSectionTitleLoadingAction extends StatelessWidget {
  const HomeSectionTitleLoadingAction({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
