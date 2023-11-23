import 'package:movie_tdd_bloc/domain/repositories/movie_repository.dart';

import '../entities/movie.dart';

class SearchMovies {
  final MovieRepository repository;
  SearchMovies({required this.repository});

  Future<List<Movie>> call(String query) async {
    return await repository.searchMovies(query);
  }
}
