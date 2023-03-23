import 'package:flutter/material.dart';

class ErrorTile extends StatelessWidget {
  const ErrorTile({
    super.key,
    this.title,
    this.description,
  });

  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? 'Unknown error'),
      subtitle:
          Text(description?.toString() ?? 'Something unexpected happened...'),
      leading: const Icon(Icons.warning_amber_outlined),
      iconColor: Theme.of(context).colorScheme.error,
      textColor: Theme.of(context).colorScheme.error,
      tileColor: Theme.of(context).colorScheme.errorContainer,
    );
  }
}
