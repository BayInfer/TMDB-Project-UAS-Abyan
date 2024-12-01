import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:last/movie/models/movie_model.dart';
import 'package:last/movie/pages/movie_detail_page.dart';
import 'package:last/movie/providers/movie_get_discover_provider.dart';
import 'package:last/movie/providers/movie_get_now_playing_provider.dart';
import 'package:last/movie/providers/movie_get_top_rated_provider.dart';
import 'package:last/widget/item_movie_widget.dart';
import 'package:provider/provider.dart';


enum TypeMovie { discover, topRated, nowPlaying }

class MoviePaginationPage extends StatefulWidget {
  const MoviePaginationPage({super.key, required this.type});

  final TypeMovie type;

  @override
  State<MoviePaginationPage> createState() => _MoviePaginationPageState();
}

class _MoviePaginationPageState extends State<MoviePaginationPage> {
  final PagingController<int, MovieModel> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      switch (widget.type) {
        case TypeMovie.discover:
          context.read<MovieGetDiscoverProvider>().getDiscoverWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        case TypeMovie.topRated:
          context.read<MovieGetTopRatedProvider>().getTopRatedWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
        
        case TypeMovie.nowPlaying:
                context.read<MovieGetNowPlayingProvider>().getNowPlayingWithPaging(
                context,
                pagingController: _pagingController,
                page: pageKey,
              );
          break;
          
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Builder(builder: (_) {
          switch (widget.type) {
            case TypeMovie.discover:
              return const Text('Upcoming');
            case TypeMovie.topRated:
              return const Text('Highest IMDB Score');
            case TypeMovie.nowPlaying:
              return const Text('On Cinema');
          }
        }),
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0.5,
      ),
      body: PagedListView.separated(
  padding: const EdgeInsets.all(16.0),
  pagingController: _pagingController,
  builderDelegate: PagedChildBuilderDelegate<MovieModel>(
    itemBuilder: (context, item, index) => ItemMovieWidget(
      movie: item,
      heightBackdrop: 220,
      widthBackdrop: double.infinity,
      onTap: () {
        // Navigasi ke halaman detail
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MovieDetailPage(id: item.id)),
        );
      },
    ),
  ),
  separatorBuilder: (context, index) => const SizedBox(height: 10),
),
    );
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }
}
