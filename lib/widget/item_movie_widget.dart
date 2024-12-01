import 'package:flutter/material.dart';
import 'package:last/movie/models/movie_detail_model.dart';
import 'package:last/movie/models/movie_model.dart';
import 'package:last/widget/image_widget.dart';

// Pengaturan Teks Di Card

class ItemMovieWidget extends Container {

  final MovieModel? movie; 
  final MovieDetailModel? movieDetail;
  final double heightBackdrop;
  final double widthBackdrop;
  final double radius;
  final void Function()? onTap;
  

  ItemMovieWidget({
    required this.heightBackdrop,
    required this.widthBackdrop,
    this.radius = 12,
    this.movie,
    this.movieDetail,
    this.onTap,
    super.key,
    });

  @override
  
  Clip get clipBehavior => Clip.hardEdge;

  @override
 
  Decoration? get decoration => BoxDecoration(
    borderRadius: BorderRadius.circular(radius)
  );

  @override
  
  Widget? get child => Stack(
                    children: [
                    ImageNetworkWidget(
                    imageSrc: '${movieDetail != null? movieDetail!.backdropPath :  movie!.backdropPath}',
                    height: heightBackdrop,
                    width: widthBackdrop,
                    
                    ),
                    Container(
                      height: heightBackdrop,
                      width: widthBackdrop,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end : Alignment.bottomCenter,
                          colors: 
                            
                            [
                              Colors.transparent,
                              Color.fromARGB(84, 0, 0, 0),
                            ]
                        )
                      ),
                    ),

                      Positioned(
                        bottom: 35,
                        left: 20,
                        right: 10,
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                   
                          Text
                          (
                            movieDetail != null? movieDetail!.title :  movie!.title,
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              ),
                          ),
                          const SizedBox(height: 9),
                          Row(
                            children: [
                              const Icon(Icons.star_rounded, color: Color.fromARGB(255, 0, 255, 204),size: 16,),
                              Text
                              (
                                '${movieDetail != null? movieDetail!.voteAverage :  movie!.voteAverage} (${movieDetail != null? movieDetail!.voteCount :  movie!.voteCount})',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ),
                      // Into Detail Page
                      Positioned.fill(child: Material(
                        color : Colors.transparent,
                        child: InkWell(
                          onTap: onTap,
                        ),
                      ),
                      ),

                    ],
                  );
}