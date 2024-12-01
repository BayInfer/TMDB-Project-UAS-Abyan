

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:last/app_constants.dart';
// ignore: unused_import
import 'package:last/main.dart';
import 'package:last/movie/components/movie_discover_component.dart';
import 'package:last/movie/components/movie_now_playing_component.dart';
import 'package:last/movie/components/movie_top_rated_component.dart';
// ignore: unused_import
import 'package:last/movie/models/movie_model.dart';
import 'package:last/movie/pages/movie_pagination_page.dart';
import 'package:last/movie/providers/movie_get_discover_provider.dart';
import 'package:last/movie/providers/movie_get_top_rated_provider.dart';
// ignore: unused_import
import 'package:last/widget/image_widget.dart';
import 'package:last/widget/item_movie_widget.dart';
import 'package:provider/provider.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  
                    child: Image.asset(
                      'assets/images/MINILOGO.png',
                    ),
                  
                ),
                const Text(''),
              ],
            ),

            floating: true,
            snap: true,
            centerTitle: true,
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
          ),

          // SlideBAR Paling Atas Paling Besar


          _WidgetTitle(
            title: 'Upcoming',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.discover,
                  ),
                ),
              );
            },
          ),
          const MovieDiscoverComponent(),


          // Menampilkan Movie Card Posisi Kedua
          _WidgetTitle(
            title: 'Highest IMDB Score',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.topRated,
                  ),
                ),
              );
            },
          ),
          const MovieTopRatedComponent(),

          
          _WidgetTitle(
            title: 'On Cinema',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const MoviePaginationPage(
                    type: TypeMovie.nowPlaying,
                  ),
                ),
              );
            },
          ),
          const MovieNowPlayingComponent(),
          
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}

class _WidgetTitle extends SliverToBoxAdapter {
  final String title;
  final void Function() onPressed;

  const _WidgetTitle({required this.title, required this.onPressed});

  @override
  Widget? get child => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
            OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.black,
                shape: const StadiumBorder(),
                side: const BorderSide(
                  color: Color.fromARGB(137, 0, 0, 0),
                ),
              ),
              child: const Text('More'),
            )
          ],
        ),
      );
}