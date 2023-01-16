import './media.dart';

const String trendsQuery = '''
  query (\$season: MediaSeason, \$seasonYear: Int, \$nextSeason: MediaSeason, \$nextYear: Int) {
    trending: Page(page: 1, perPage: 10) {
      media(sort: TRENDING_DESC, type: ANIME, isAdult: false) {
        ...media
      }
    }
    season: Page(page: 1, perPage: 10) {
      media(season: \$season, seasonYear: \$seasonYear, sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
        ...media
      }
    }
    nextSeason: Page(page: 1, perPage: 10) {
      media(season: \$nextSeason, seasonYear: \$nextYear, sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
        ...media
      }
    }
    popular: Page(page: 1, perPage: 10) {
      media(sort: POPULARITY_DESC, type: ANIME, isAdult: false) {
        ...media
      }
    }
    top: Page(page: 1, perPage: 10) {
      media(sort: SCORE_DESC, type: ANIME, isAdult: false) {
        ...media
      }
    }
  }
}

$mediaFragment
''';
