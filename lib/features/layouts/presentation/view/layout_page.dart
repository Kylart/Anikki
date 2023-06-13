import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:anikki/features/layouts/presentation/view/layout_view.dart';
import 'package:anikki/features/layouts/presentation/bloc/layout_bloc.dart';

class LayoutPage extends StatelessWidget {
  const LayoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LayoutBloc(),
      child: const LayoutView(),
    );
  }
}
