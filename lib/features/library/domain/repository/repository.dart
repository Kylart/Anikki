import 'package:anikki/core/core.dart';
import 'package:anikki/features/library/domain/usecases/usecases.dart'
    as usecases;

///
/// [LibraryRepository] should only be used by the [LibraryBloc] class.
/// Its main objective is to be able to be mocked during testing phases.
///
class LibraryRepository {
  const LibraryRepository();

  Future<List<LocalFile>> retrieveFilesFromPath(String path) async {
    return usecases.retrieveFilesFromPath(path: path);
  }

  Future<LocalFile> getFile(String path) async {
    return LocalFile.createAndSearchMedia(path);
  }
}
