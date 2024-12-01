import 'dart:math';

import 'package:flutter/material.dart';
import 'package:last/injector.dart';
import 'package:last/movie/models/movie_detail_model.dart';
import 'package:last/movie/providers/movie_get_detail_provider.dart';
import 'package:last/widget/item_movie_widget.dart';
import 'package:provider/provider.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
    create: (_)=> sl<MovieGetDetailProvider>()..getDetail(context, id: id),
    builder: (_,__) => Scaffold(
      body: CustomScrollView(
        slivers: [

          _WidgetAppBar(context),
          _WidgetSummary(),
          
       
        ],
      ),
    ),
    );
  }
}

class _WidgetAppBar extends SliverAppBar {
    final BuildContext context;

  _WidgetAppBar(this.context);

    @override
    Color? get backgroundColor => Colors.white;
    
    @override
    Color? get foregroundColor => Colors.black;

    @override
    Widget? get leading => Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: IconButton(
          onPressed: () {
            Navigator.pop (context);
          },
          icon: const Icon(
            Icons.arrow_back_rounded,
            ),
            ),
      ),
    );

    @override
  
  List<Widget>? get actions =>[
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        child: IconButton(
          onPressed: () {
            
          },
          icon: const Icon(
            Icons.public_rounded,
            ),
            ),
      ),
    ),
  ];
  
  
    
    @override
    double? get expandedHeight => 300;

    @override
    Widget? get flexibleSpace => Consumer<MovieGetDetailProvider>(
      builder: (_,provider,__) {
       final movie = provider.movie;

       if (movie != null) {
        return ItemMovieWidget(
          movieDetail: movie,
          heightBackdrop: double.infinity,
          widthBackdrop: double.infinity,
          radius: 0,
          );
       }

       return Container(
        color : Colors.black,
        height: double.infinity,
        width: double.infinity,
       );
      },
      );

   
}

class _WidgetSummary extends SliverToBoxAdapter {

  Widget _content ({required String title, required Widget body}) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
                      Text(
                          title,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,  
                          ),
                          ),

                          // Jarak Antar Column
                          SizedBox(height: 8),
                    
                          body,

                          // Jarak Antar Widget
                          SizedBox(height: 16,),
    ],
  );

  TableRow _tableContent({required String title, required String content}) => 
                    TableRow(children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  title,
                                  style: TextStyle(fontWeight:  FontWeight.w900),
                                  ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(content),
                              ),
                            ]);


  @override
  Widget? get child => Padding(
    padding: const EdgeInsets.all(16.0),
    child: Consumer<MovieGetDetailProvider>(
        builder:(_, provider, __) {
            final movie = provider.movie;
      
            if (movie != null) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [

                    
                    _content(
                      title: 'Release Date', 
                      // Icon dan Tanggal
                      body: Row(
                            children: [
                              // Icon
                              Icon(
                                Icons.calendar_month_rounded,
                                size : 32,
                                ),

                              // Jarak Antar Row
                              SizedBox(width: 8),

                              // Tanggal
                              Text(
                                movie.releaseDate.toString().split(' ').first,
                                style: TextStyle(
                                  fontSize: 16,
                                  // fontStyle: FontStyle.italic,
                                ),
                                ),
                            ],
                          ),
                          ),

                    // Genres
                    _content(
                      title: 'Genres', 
                      body: Wrap(
                        spacing: 8,
                        children: movie.genres
                        .map((genre) => Chip(label: Text(genre.name)))
                        .toList() ,
                      ),
                    ),

                    // Overview
                    _content(
                      title: 'Overview', 
                      body: Text(movie.overview)
                    ),

                    // Tabel Summary
                    _content(
                      title: 'Summary', 
                      body: Table(
                        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                        columnWidths: {
                          0: FlexColumnWidth (1),
                          1: FlexColumnWidth (2),
                        },

                        // Style Table
                        border: TableBorder.all(
                          color : Colors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),

                        children: [

                            // _tableContent(title: "Adult", content: movie.adult ? "Yes" : "No"),
                            _tableContent(title: "Popularity", content: '${movie.popularity}'),
                            _tableContent(title: "Status", content: '${movie.status}'),
                            _tableContent(title: "Production Budget", content: '${movie.budget}'),
                            _tableContent(title: "Revenue", content: '${movie.revenue}'),
                            _tableContent(title: "Tagline", content: '${movie.tagline}'),
                          
                        ],

                      )
                    ),  

                  ],
                );
            }
                  
            
            return Container();
        
        },
    ),
  );


   }