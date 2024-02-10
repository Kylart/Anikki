part of 'models.dart';

enum Quality {
  low('480p'),
  medium('720p'),
  high('1080p');

  final String value;

  const Quality(this.value);
}
