String getShortName({required String name}) {
  // TODO: repalce this with anitomy method
  final List<String> parts = name.split(' ');
  final int lastIndex = parts.indexOf('-');

  if (lastIndex == -1) return '';

  return parts.sublist(1, lastIndex).join(' ');
}
