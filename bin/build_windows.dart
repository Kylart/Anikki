// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:innosetup/innosetup.dart';
import 'package:version/version.dart';

void main() {
  InnoSetup(
    app: InnoSetupApp(
      name: 'Anikki',
      version: Version.parse('1.0.0'),
      publisher: 'Kylart',
      urls: InnoSetupAppUrls(
        homeUrl: Uri.parse('https://github.com/Kylart/Anikki'),
      ),
    ),
    files: InnoSetupFiles(
      executable: File('build/windows/runner/anikki.exe'),
      location: Directory('build/windows/runner'),
    ),
    name: const InnoSetupName('windows_installer'),
    location: InnoSetupInstallerDirectory(
      Directory('dist/'),
    ),
    icon: InnoSetupIcon(
      File('../assets/icon.ico'),
    ),
  ).make();
}
