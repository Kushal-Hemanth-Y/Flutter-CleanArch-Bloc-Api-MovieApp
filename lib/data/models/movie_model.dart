import 'package:mockito/mockito.dart';
import 'package:movie_tdd_bloc/domain/entities/movie.dart';

class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterpath;

  MovieModel(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterpath});

  // It convert json into MovieModel

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json['id'],
        title: json['title'],
        overview: json['overview'],
        posterpath: json['poster_path']);
  }

  // It convert MovieModel into json
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'poster_path': posterpath,
    };
  }

  // covert to entity
  Movie toEntity() {
    return Movie(
        id: id, title: title, overview: overview, posterpath: posterpath);
  }
}
