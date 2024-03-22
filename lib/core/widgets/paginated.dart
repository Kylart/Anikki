import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

const kPaginatedPerPage = 12;

class Paginated extends StatefulWidget {
  const Paginated({
    super.key,
    required this.numberOfEntries,
    required this.pageBuilder,
    this.perPage = kPaginatedPerPage,
    this.initialPage = 0,
  });

  final int numberOfEntries;
  final Widget Function(BuildContext context, int page) pageBuilder;
  final int perPage;
  final int initialPage;

  @override
  State<Paginated> createState() => _PaginatedState();
}

class _PaginatedState extends State<Paginated> {
  late int page;
  final radius = const Radius.circular(40);

  int get maxPage => (widget.numberOfEntries / widget.perPage).ceil() - 1;

  void updatePage(int newPage) {
    if (newPage < 0 || newPage > maxPage) return;

    setState(() {
      page = newPage;
    });
  }

  @override
  void initState() {
    super.initState();
    updatePage(widget.initialPage);
  }

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.outline;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (maxPage != 0)
          Padding(
            padding: const EdgeInsets.only(
              left: 4.0,
              right: 4.0,
              bottom: 8.0,
            ),
            child: SizedBox(
              height: 40,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: color,
                        ),
                        borderRadius: BorderRadius.all(radius),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.only(
                              topLeft: radius,
                              bottomLeft: radius,
                            ),
                            onTap: () => updatePage(page - 1),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Ionicons.chevron_back_outline),
                                ],
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: color,
                            width: 1,
                          ),
                          SizedBox(
                            width: 110,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Page ${page + 1} of ${maxPage + 1}',
                              ),
                            ),
                          ),
                          VerticalDivider(
                            color: color,
                            width: 1,
                          ),
                          InkWell(
                            borderRadius: BorderRadius.only(
                              topRight: radius,
                              bottomRight: radius,
                            ),
                            onTap: () => updatePage(page + 1),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Ionicons.chevron_forward_outline),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        Flexible(
          child: widget.pageBuilder(
            context,
            page,
          ),
        ),
      ],
    );
  }
}
