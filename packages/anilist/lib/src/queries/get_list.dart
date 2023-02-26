const String getListQuery = '''
query (\$username: String) {
	MediaListCollection(userName: \$username, type: ANIME) {
		lists {
			entries {
				score
				progress
				status
				notes
				repeat
				private
				startedAt {
					year
					month
					day
				}
				completedAt {
					year
					month
					day
				}
				media {
					id
          genres
					coverImage {
						extraLarge
						large
					}
          bannerImage
					title {
						userPreferred
						native
						english
						romaji
					}
					episodes
					format
				}
			}
		}
	}
}
''';
