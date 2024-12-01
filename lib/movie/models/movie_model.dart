// // To parse this JSON data, do
// //
// //     final movieResponseModel = movieResponseModelFromJson(jsonString);

// import 'dart:convert';

// MovieResponseModel movieResponseModelFromJson(String str) => MovieResponseModel.fromJson(json.decode(str));

// String movieResponseModelToJson(MovieResponseModel data) => json.encode(data.toJson());

// class MovieResponseModel {
//     int page;
//     List<MovieModel> MovieModels;
//     int totalPages;
//     int totalMovieModels;

//     MovieResponseModel({
//         required this.page,
//         required this.MovieModels,
//         required this.totalPages,
//         required this.totalMovieModels,
//     });

//     factory MovieResponseModel.fromJson(Map<String, dynamic> json) => MovieResponseModel(
//         page: json["page"],
//         MovieModels: List<MovieModel>.from(json["MovieModels"].map((x) => MovieModel.fromJson(x))),
//         totalPages: json["total_pages"],
//         totalMovieModels: json["total_MovieModels"],
//     );

//     Map<String, dynamic> toJson() => {
//         "page": page,
//         "MovieModels": List<dynamic>.from(MovieModels.map((x) => x.toJson())),
//         "total_pages": totalPages,
//         "total_MovieModels": totalMovieModels,
//     };
// }

// class MovieModel {
//     bool adult;
//     String backdropPath;
//     List<int> genreIds;
//     int id;
//     String originalLanguage;
//     String originalTitle;
//     String overview;
//     double popularity;
//     String posterPath;
//     DateTime releaseDate;
//     String title;
//     bool video;
//     double voteAverage;
//     int voteCount;

//     MovieModel({
//         required this.adult,
//         required this.backdropPath,
//         required this.genreIds,
//         required this.id,
//         required this.originalLanguage,
//         required this.originalTitle,
//         required this.overview,
//         required this.popularity,
//         required this.posterPath,
//         required this.releaseDate,
//         required this.title,
//         required this.video,
//         required this.voteAverage,
//         required this.voteCount,
//     });

//     factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
//         adult: json["adult"],
//         backdropPath: json["backdrop_path"],
//         genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//         id: json["id"],
//         originalLanguage: json["original_language"],
//         originalTitle: json["original_title"],
//         overview: json["overview"],
//         popularity: json["popularity"]?.toDouble(),
//         posterPath: json["poster_path"],
//         releaseDate: DateTime.parse(json["release_date"]),
//         title: json["title"],
//         video: json["video"],
//         voteAverage: json["vote_average"]?.toDouble(),
//         voteCount: json["vote_count"],
//     );

//     Map<String, dynamic> toJson() => {
//         "adult": adult,
//         "backdrop_path": backdropPath,
//         "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//         "id": id,
//         "original_language": originalLanguage,
//         "original_title": originalTitle,
//         "overview": overview,
//         "popularity": popularity,
//         "poster_path": posterPath,
//         "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//         "title": title,
//         "video": video,
//         "vote_average": voteAverage,
//         "vote_count": voteCount,
//     };
// }


class MovieResponseModel {
  MovieResponseModel({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  final int page;
  final List<MovieModel> results;
  final int totalPages;
  final int totalResults;

  factory MovieResponseModel.fromMap(Map<String, dynamic> json) =>
      MovieResponseModel(
        page: json["page"],
        results: List<MovieModel>.from(
            json["results"].map((x) => MovieModel.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );
}

class MovieModel {
  MovieModel({
    this.backdropPath,
    required this.id,
    required this.overview,
    this.posterPath,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  final String? backdropPath;
  final int id;
  final String overview;
  final String? posterPath;
  final String title;
  final double voteAverage;
  final int voteCount;

  factory MovieModel.fromMap(Map<String, dynamic> json) => MovieModel(
        backdropPath: json["backdrop_path"] ?? '',
        id: json["id"],
        overview: json["overview"],
        posterPath: json["poster_path"] ?? '',
        title: json["title"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );
}

