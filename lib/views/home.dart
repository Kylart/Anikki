import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kawanime/components/animeCard.dart';
import 'package:kawanime/providers/anilist.dart';
import 'package:kawanime/services/externals/anilist/types/schedule_entry.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    bool hasEntries = !context.watch<AnilistStore>().anilist.airingSchedule.hasEntries;
    List<ScheduleEntry> latestEntries = context
      .watch<AnilistStore>()
      .anilist.airingSchedule
      .latestEntries;

    return SafeArea(
      child: GestureDetector(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'What\'s new today?',
                          style: GoogleFonts.poppins(
                            textStyle: Theme.of(context).textTheme.headline4
                          ),
                        ),
                      ],
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),

            hasEntries
              ? const EntriesLoader()
              : EntriesView(entries: latestEntries),
          ],
        ),
      ),
    );
  }
}

class EntriesLoader extends StatelessWidget {
  const EntriesLoader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverFillRemaining(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class EntriesView extends StatelessWidget {
  const EntriesView({
    Key? key,
    required this.entries,
  }) : super(key: key);

  final List<ScheduleEntry> entries;

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        delegate: SliverChildListDelegate(
          entries
              .map(
                (entry) => AnimeCard(entry: entry),
              )
              .toList(),
        ),
        gridDelegate:
            const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 400,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.6,
        ),
      );
  }
}
