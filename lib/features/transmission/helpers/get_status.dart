String getStatus(int status) {
  assert(status >= 0 && status <= 7, 'Invalid Status');

  return [
    'Stopped',
    'Queued to verify local data',
    'Verifying local data',
    'Queued to download',
    'Downloading',
    'Queued to seed',
    'Seeding',
    'Unknown Status',
  ].elementAt(status);
}
