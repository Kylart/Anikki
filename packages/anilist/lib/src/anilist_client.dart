import 'package:graphql/client.dart';

abstract class AnilistClient {
  final GraphQLClient client;

  AnilistClient({required this.client});
}
