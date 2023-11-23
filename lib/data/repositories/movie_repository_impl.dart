import 'package:movie_tdd_bloc/data/datasources/movie_remote_data_source.dart';
import 'package:movie_tdd_bloc/data/models/movie_model.dart';
import 'package:movie_tdd_bloc/domain/entities/movie.dart';
import 'package:movie_tdd_bloc/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<Movie>> getPopularMovies() async {
   final List<MovieModel> movieModels = await remoteDataSource.getPopularMovies();
   final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
   return movies;
  }

  @override
  Future<List<Movie>> getTrendingMovies() async {
    final List<MovieModel> movieModels = await remoteDataSource.getTrendingMovies();
   final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
   return movies;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final List<MovieModel> movieModels = await remoteDataSource.searchMovies(query);
   final List<Movie> movies = movieModels.map((model) => model.toEntity()).toList();
   return movies;
  }


}