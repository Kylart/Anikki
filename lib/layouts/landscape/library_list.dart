import 'package:flutter/material.dart';

class LibraryList extends StatefulWidget {
  const LibraryList({
    Key? key,
  }) : super(key: key);

  @override
  State<LibraryList> createState() => _LibraryListState();
}

class _LibraryListState extends State<LibraryList> {
  final List<bool> layoutSelected = <bool>[true, false];
  final List<bool> listSelected = <bool>[true, false];

  String get layout => layoutSelected[0] == true ? 'list' : 'grid';
  String get listType => layoutSelected[0] == true ? 'library' : 'watch_list';

  @override
  Widget build(BuildContext context) {
    final outlineColor = Theme.of(context).colorScheme.outline;

    return Flexible(
      flex: 2,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: outlineColor,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(5)),
        ),
        child: Column(
          children: [
            AppBar(
              title: ToggleButtons(
                constraints: const BoxConstraints(
                  minHeight: 40.0,
                  minWidth: 120.0,
                ),
                isSelected: listSelected,
                onPressed: (int index) {
                  setState(() {
                    // The button that is tapped is set to true, and the others to false.
                    for (int i = 0; i < listSelected.length; i++) {
                      listSelected[i] = i == index;
                    }
                  });
                },
                children: const [
                  Text('Library'),
                  Text('Watch List'),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ToggleButtons(
                    isSelected: layoutSelected,
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < layoutSelected.length; i++) {
                          layoutSelected[i] = i == index;
                        }
                      });
                    },
                    children: const [
                      Icon(Icons.list),
                      Icon(Icons.grid_view),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings),
                  ),
                )
              ],
            ),
            Divider(
              color: outlineColor,
              height: 1,
            ),
          ],
        ),
      ),
    );
  }
}
