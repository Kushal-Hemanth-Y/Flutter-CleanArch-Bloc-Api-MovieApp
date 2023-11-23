import 'package:get_it/get_it.dart';
import 'package:movie_tdd_bloc/data/datasources/movie_remote_data_source.dart';
import 'package:movie_tdd_bloc/data/datasources/remote/movie_remote_data_source_implementation.dart';
import 'package:movie_tdd_bloc/data/repositories/movie_repository_impl.dart';
import 'package:movie_tdd_bloc/domain/repositories/movie_repository.dart';
import 'package:movie_tdd_bloc/domain/usecases/get_popular_movies.dart';
import 'package:movie_tdd_bloc/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:http/http.dart' as http;
import 'domain/usecases/get_trending_movies.dart';
import 'domain/usecases/search_movies.dart';
import 'presentation/bloc/serach_movies/search_movies_bloc.dart';
import 'presentation/bloc/trending_movies/trending_movies_bloc.dart';

final GetIt getIt = GetIt.instance;

void init() {
// Blocs

  getIt.registerFactory(() => PopularMoviesBloc(getPopularMovies: getIt()));
  getIt.registerFactory(() => TrendingMoviesBloc(getTrendingMovies: getIt()));
  getIt.registerFactory(() => SearchMoviesBloc(searchMovies: getIt()));

// Use Cases

  getIt.registerLazySingleton(() => GetPopularMovies(repository: getIt()));
  getIt.registerLazySingleton(() => GetTrendingMovies(repository: getIt()));
  getIt.registerLazySingleton(() => SearchMovies(repository: getIt()));

// Repositoories

  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));

// Data Sources
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: getIt()));

// Http Service
  getIt.registerLazySingleton(() => http.Client());
}
