String getSeason({bool next = false}) {
  final DateTime now = DateTime.now();
  final int currentMonth = now.month;

  if (currentMonth >= 1 && currentMonth <= 3) return next ? 'SPRING' : 'WINTER';
  if (currentMonth >= 4 && currentMonth <= 6) return next ? 'SUMMER' : 'SPRING';
  if (currentMonth >= 7 && currentMonth <= 9) return next ? 'FALL' : 'SUMMER';

  return next ? 'WINTER' : 'FALL';
}
