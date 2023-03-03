const String mediaFragment = r'''
  fragment media on Media {
    id
    title {
      userPreferred
      romaji
      english
      native
    }
    coverImage {
      extraLarge
      large
      medium
      color
    }
    startDate {
      year
      month
      day
    }
    endDate {
      year
      month
      day
    }
    bannerImage
    season
    description
    type
    format
    status(version: 2)
    episodes
    duration
    chapters
    volumes
    genres
    isAdult
    averageScore
    popularity
    countryOfOrigin
    mediaListEntry {
      id
      status
    }
    nextAiringEpisode {
      airingAt
      timeUntilAiring
      episode
    }
    studios(isMain: true) {
      edges {
        isMain
        node {
          id
          name
        }
      }
    }
    relations {
      edges {
        relationType(version: 2)
        node {
          id
          title {
            romaji
            native
            english
          }
          siteUrl
        }
      }
    }
  }
''';

const String shortMediaFragment = r'''
  fragment media on Media {
    title {
      userPreferred
      romaji
      english
      native
    }
    coverImage {
      extraLarge
      large
      medium
      color
    }
    bannerImage
    genres
    isAdult
    popularity
    countryOfOrigin
  }
''';
