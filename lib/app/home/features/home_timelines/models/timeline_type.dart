enum TimelineType {
  feed('Coming up'),
  history('History'),
  notifications('Notifications');

  final String title;

  const TimelineType(this.title);
}
