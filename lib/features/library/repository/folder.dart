part of 'repository.dart';

Future<void> openFolderInExplorer(BuildContext context) async {
  final path =
      BlocProvider.of<SettingsBloc>(context).state.settings.localDirectory;

  OpenAppFile.open(path);
}
