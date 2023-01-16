// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:kawanime/components/shared/anime_card.dart';
import 'package:kawanime/providers/anilist/anilist.dart';

import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 7,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 6,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              'What you missed',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text('Today'),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.tune),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GridView(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.75,
                            ),
                            children: const [
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: const SizedBox(
                  height: 1,
                  width: 150,
                  child: Divider(),
                ),
              ),
              Flexible(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 16.0),
                            child: Text(
                              'Check out more',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.search),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.tune),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: GridView(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 200,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0,
                              childAspectRatio: 0.75,
                            ),
                            children: const [
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                              AnimeCard(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 80.0),
          child: VerticalDivider(
            thickness: 1,
            width: 1,
          ),
        ),
        Flexible(
          flex: 3,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Animes in library',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).cardColor,
                    backgroundBlendMode: BlendMode.softLight,
                  ),
                  child: SizedBox(
                    height: 75,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text('1.689'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Animes watched',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).cardColor,
                    backgroundBlendMode: BlendMode.softLight,
                  ),
                  child: SizedBox(
                    height: 75,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text('2.908.237'),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    'Wasted time (today)',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: Theme.of(context).cardColor,
                    backgroundBlendMode: BlendMode.softLight,
                  ),
                  child: SizedBox(
                    height: 75,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text('2h34m'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
