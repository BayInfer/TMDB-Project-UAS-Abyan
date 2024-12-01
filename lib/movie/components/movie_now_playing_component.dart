import 'package:flutter/material.dart';
import 'package:last/movie/pages/movie_detail_page.dart';
import 'package:last/movie/providers/movie_get_now_playing_provider.dart';
import 'package:last/widget/image_widget.dart';
import 'package:provider/provider.dart';

class MovieNowPlayingComponent extends StatefulWidget {
  const MovieNowPlayingComponent({super.key});

  @override
  State<MovieNowPlayingComponent> createState() =>
      _MovieNowPlayingComponentState();
}

class _MovieNowPlayingComponentState extends State<MovieNowPlayingComponent> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<MovieGetNowPlayingProvider>().getNowPlaying(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200, // Tinggi total (gambar termasuk teks)
        child: Consumer<MovieGetNowPlayingProvider>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(66, 0, 0, 0),
                  borderRadius: BorderRadius.circular(12.0),
                ),
              );
            }

            if (provider.movies.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final movie = provider.movies[index];
                  return GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman detail
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) {
                          return MovieDetailPage(id: movie.id);
                        }),
                      );
                    },
                    child: Stack(
                      children: [
                        // Gambar
                        ImageNetworkWidget(
                          imageSrc: movie.backdropPath, // Properti gambar
                          height: 200,
                          width: 300,
                          radius: 12.0,
                        ),
                        // Overlay dengan teks
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 4.0),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(0, 0, 255, 221), // Latar belakang teks transparan
                              borderRadius: const BorderRadius.only(
                                bottomLeft: Radius.circular(12.0),
                                bottomRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie.title, // Properti judul
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis, // Potong jika terlalu panjang
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 8.0,
                ),
                itemCount: provider.movies.length,
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Text('Not found Now Playing movies'),
              ),
            );
          },
        ),
      ),
    );
  }
}
