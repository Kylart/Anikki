const String deleteListEntryQuery = '''
mutation (\$mediaId: Int) {
	DeleteMediaListEntry(id: \$mediaId) {
		deleted
	}
}
''';
