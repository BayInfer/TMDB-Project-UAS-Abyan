import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:last/movie/pages/movie_detail_page.dart';
import 'package:last/widget/item_movie_widget.dart';
import 'package:provider/provider.dart';
import 'package:last/movie/providers/movie_get_discover_provider.dart';


class MovieDiscoverComponent extends StatefulWidget {
  const MovieDiscoverComponent({super.key});

  @override
  State<MovieDiscoverComponent> createState() => _MovieDiscoverComponentState();
}

class _MovieDiscoverComponentState extends State<MovieDiscoverComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieGetDiscoverProvider>().getDiscover(context);
    });
    super.initState();
    
  }

  // Menantukan  Besar Kecil Kotak Hypley

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Consumer<MovieGetDiscoverProvider>(
        builder: (_, provider, __) {
          // Lagi Loading
          if (provider.isLoading) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 250.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(10),
              ),
            );
          }
          
          // Menampilkan Movie
          if (provider.movies.isNotEmpty) {
            return CarouselSlider.builder(
              itemCount: provider.movies.length,
              itemBuilder: (_, index, __) {
                final movie = provider.movies[index];
                return ItemMovieWidget(
                  movie: movie,
                  heightBackdrop: 250,
                  widthBackdrop: double.infinity,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return MovieDetailPage(id: movie.id);
                    },
                    ));
                  } ,
          // Not Found 
                );
              },
              options: CarouselOptions(
                height: 250.0,
                viewportFraction: 0.8,
                reverse: false,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            );
          }

          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            height: 250.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black26,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Text(
                'Not found discover movies',
                style: TextStyle(
                  color: Colors.black45,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
