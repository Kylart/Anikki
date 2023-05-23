import 'package:equatable/equatable.dart';
import 'package:nyaa/nyaa.dart';

class DownloaderFilter extends Equatable {
  const DownloaderFilter({
    this.smartFilter = true,
    this.qualities = const [Quality.high],
    this.showAll = false,
    this.more,
  });

  final bool smartFilter;
  final List<Quality> qualities;
  final bool showAll;
  final String? more;

  DownloaderFilter copyWith({
    bool? smartFilter,
    List<Quality>? qualities,
    bool? showAll,
    String? more,
  }) {
    return DownloaderFilter(
      smartFilter: smartFilter ?? this.smartFilter,
      qualities: qualities ?? this.qualities,
      showAll: showAll ?? this.showAll,
      more: more ?? this.more,
    );
  }

  @override
  List<Object?> get props => [
        smartFilter,
        qualities,
        showAll,
        more,
      ];
}
