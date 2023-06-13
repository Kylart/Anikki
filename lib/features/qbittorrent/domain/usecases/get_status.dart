const kQbitTorrentStatuses = {
  'error': 'Error',
  'missingFiles': 'Torrent data files is missing',
  'uploading': 'Uploading',
  'pausedUP': 'Paused',
  'queuedUP': 'Queued',
  'stalledUP': 'Seeding - No peer connection',
  'checkingUP': 'Checking',
  'forcedUP': 'Uploading',
  'allocating': 'Allocating',
  'downloading': 'Downloading',
  'metaDL': 'Fetching metadata',
  'pausedDL': 'Paused',
  'queuedDL': 'Queued',
  'stalledDL': 'Downloading - No peer connection',
  'checkingDL': 'Checking',
  'forcedDL': 'Downloading',
  'checkingResumeData': 'Resuming',
  'moving': 'Moving',
  'unknown': 'Unknown',
};

String getStatus(String? state) {
  if (kQbitTorrentStatuses.containsKey(state)) {
    return kQbitTorrentStatuses[state]!;
  }

  return 'Unknown';
}