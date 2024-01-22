import 'dart:math';

import 'package:flutter/material.dart';

extension BuildContextNotify on BuildContext {
  void notify({
    required String message,
    String? descritpion,
    bool? isError = false,
  }) {
    const maxWidth = 500;
    const sidePadding = 8.0;
    final theme = Theme.of(this);
    final screenWidth = MediaQuery.of(this).size.width;
    final snackbarWidth = min(screenWidth, maxWidth);

    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        margin: screenWidth < maxWidth - (sidePadding * 2)
            ? const EdgeInsets.all(sidePadding)
            : EdgeInsets.only(
                left: screenWidth - snackbarWidth,
                right: sidePadding,
                bottom: sidePadding,
              ),
        padding: const EdgeInsets.symmetric(horizontal: sidePadding),
        elevation: 0,
        showCloseIcon: true,
        content: ListTile(
          title: Text(message),
          subtitle: descritpion != null ? Text(descritpion) : null,
          textColor: isError == true
              ? theme.colorScheme.onError
              : theme.colorScheme.onSecondary,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        backgroundColor: isError == true
            ? theme.colorScheme.error
            : theme.colorScheme.secondary,
      ),
    );
  }
}
