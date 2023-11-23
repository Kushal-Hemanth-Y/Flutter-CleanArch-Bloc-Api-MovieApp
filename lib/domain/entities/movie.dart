import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String overview;
  final String posterpath;

  Movie(
      {required this.id,
      required this.title,
      required this.overview,
      required this.posterpath});

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, overview, posterpath];
}
