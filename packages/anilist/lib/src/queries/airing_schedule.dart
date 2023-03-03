import './media.dart';

const String airingScheduleQuery = '''
query (\$weekStart: Int, \$weekEnd: Int, \$page: Int) {
	Page(page: \$page) {
		pageInfo {
			hasNextPage
			total
		}
		airingSchedules(airingAt_greater: \$weekStart, airingAt_lesser: \$weekEnd) {
			id
			episode
			airingAt
			media {
        ...media
      }
    }
  }
}

$shortMediaFragment
''';
