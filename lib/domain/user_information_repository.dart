import 'package:anikki/app/home/features/home_timelines/models/models.dart';
import 'package:anikki/core/core.dart';
import 'package:anikki/data/data.dart';

/// Repository that handles user information related data (for now only Anilist)
class UserInformationRepository {
  const UserInformationRepository(this.anilist);

  /// The [Anilist] object to use to interact with Anilist.
  final Anilist anilist;

  Future<List<TimelineEntry>> getActivities(int userId) async {
    final activities = await anilist.getActivities(userId);

    return activities
        .map(
          (activity) => TimelineEntry(
            type: TimelineType.history,
            timestamp: activity.createdAt * 1000,
            media: Media(anilistInfo: activity.media),
            description: [
              activity.status,
              activity.progress ?? '',
            ].join(' ').trim().capitalize(),
          ),
        )
        .toList();
  }
}
