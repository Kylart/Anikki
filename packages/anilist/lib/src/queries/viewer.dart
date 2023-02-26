const String viewerQuery = '''
  query {
    Viewer {
      name
      avatar {
        large
        medium
      }
      bannerImage
      isBlocked
      options {
        displayAdultContent
        airingNotifications
        profileColor
      }
    }
  }
''';
