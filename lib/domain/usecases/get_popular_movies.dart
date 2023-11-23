import 'package:movie_tdd_bloc/domain/repositories/movie_repository.dart';

import '../entities/movie.dart';

class GetPopularMovies {
  final MovieRepository repository;

  GetPopularMovies({required this.repository});

  Future<List<Movie>> call() async {
    return await repository.getPopularMovies();
  }
}
