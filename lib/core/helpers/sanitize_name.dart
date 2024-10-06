final toRemoveCharacters = [
  r'\[',
  r'\]',
  r':',
];

String sanitizeName(String name) => name.replaceAll(
      RegExp('(${toRemoveCharacters.join('|')})'),
      '',
    );
