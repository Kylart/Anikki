// ignore: depend_on_referenced_packages
import "package:dart_pre_commit/dart_pre_commit.dart";
// ignore: depend_on_referenced_packages
import 'package:git_hooks/git_hooks.dart';

void main(List<String> arguments) {
  final params = {Git.preCommit: _preCommit};
  GitHooks.call(arguments, params);
}

Future<bool> _preCommit() async {
  final result = await DartPreCommit.run();
  return result.isSuccess;
}

Future<bool> commitMsg() async {
  // var commitMsg = Utils.getCommitEditMsg();
  // if (commitMsg.startsWith('fix:')) {
  //   return true; // you can return true let commit go
  // } else {
  //   print('you should add `fix` in the commit message');
  //   return false;
  // }
  return true;
}

Future<bool> preCommit() async {
  // try {
  //   ProcessResult result = await Process.run('dartanalyzer', ['bin']);
  //   print(result.stdout);
  //   if (result.exitCode != 0) return false;
  // } catch (e) {
  //   return false;
  // }
  return true;
}
