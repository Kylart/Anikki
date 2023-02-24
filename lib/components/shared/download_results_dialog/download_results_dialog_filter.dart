import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:anikki/providers/nyaa/types/quality.dart';

class FilterValueHandler<T, U> {
  FilterValueHandler(this.value, this.onChange);

  final T value;
  final void Function(U value) onChange;
}

class DownloadResultsFilter extends StatelessWidget {
  const DownloadResultsFilter({
    super.key,
    required this.showAll,
    required this.smartFilter,
    required this.qualities,
    required this.releaseGroup,
    required this.additionalTerm,
  });

  final FilterValueHandler<bool, bool> showAll;
  final FilterValueHandler<bool, bool> smartFilter;
  final FilterValueHandler<List<Quality>, Quality> qualities;
  final FilterValueHandler<TextEditingController, String> releaseGroup;
  final FilterValueHandler<TextEditingController, String> additionalTerm;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        switchTile(
          label: 'Show all',
          value: showAll.value,
          onChanged: showAll.onChange,
        ),
        switchTile(
          label: 'Smart filter',
          value: smartFilter.value,
          onChanged: smartFilter.onChange,
        ),
        textFieldTile(
          controller: releaseGroup.value,
          onChanged: releaseGroup.onChange,
          hintText: 'Enter a Release group',
        ),
        textFieldTile(
          controller: additionalTerm.value,
          onChanged: additionalTerm.onChange,
          hintText: 'Anything else?',
        ),
        qualityChoiceTile(
          onTap: qualities.onChange,
          qualities: qualities.value,
          selectedColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

Widget switchTile({
  required void Function(bool value) onChanged,
  required String label,
  required bool value,
}) {
  return Flexible(
    flex: 1,
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(label),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    ),
  );
}

Widget qualityChoiceTile({
  required void Function(Quality quality) onTap,
  required List<Quality> qualities,
  required Color selectedColor,
}) {
  return Flexible(
    flex: 3,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: Quality.values.map<Widget>((quality) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: InkWell(
            onTap: () => onTap(quality),
            child: Chip(
              backgroundColor:
                  qualities.contains(quality) ? selectedColor : null,
              label: Text(quality.name.capitalize),
            ),
          ),
        );
      }).toList(),
    ),
  );
}

Widget textFieldTile({
  required void Function(String value) onChanged,
  required TextEditingController controller,
  required String hintText,
}) {
  return SizedBox(
    width: 300,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        autocorrect: false,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: hintText,
          suffixIcon: IconButton(
            onPressed: controller.clear,
            icon: const Icon(Icons.clear),
          ),
        ),
      ),
    ),
  );
}
