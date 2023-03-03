import 'package:anilist/src/queries/media.dart';

const String searchQuery = '''
query (\$search: String) {
	Page(perPage: 8) {
		results: media(type: ANIME, search: \$search) {
			...media
		}
	}
}

$shortMediaFragment
''';
