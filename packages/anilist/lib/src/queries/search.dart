import 'package:anilist/src/queries/media.dart';

const String searchQuery = '''
query (\$search: String) {
	anime: Page(perPage: 4) {
		pageInfo {
			total
		}
		results: media(type: ANIME, search: \$search) {
      ...media
		}
	}

	characters: Page(perPage: 4) {
		pageInfo {
			total
		}
		results: characters(search: \$search) {
			id
			siteUrl
      description
			name {
				full
				native
			}
			image {
        large
        medium
			}
		}
	}

	staff: Page(perPage: 4) {
		pageInfo {
			total
		}
		results: staff(search: \$search) {
			id
			siteUrl
			primaryOccupations
			name {
				full
				native
			}
			image {
        large
        medium
			}
		}
	}
}

$shortMediaFragment
''';
