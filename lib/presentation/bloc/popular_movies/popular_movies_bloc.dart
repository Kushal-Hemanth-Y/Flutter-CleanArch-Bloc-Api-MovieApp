import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_tdd_bloc/domain/usecases/get_popular_movies.dart';

import '../../../domain/entities/movie.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  final GetPopularMovies getPopularMovies;
  PopularMoviesBloc({required this.getPopularMovies})
      : super(PopularMoviesInitial()) {
    on<FetchPopularMoviesEvent>(fetchPopularMoviesEvent);
  }

  FutureOr<void> fetchPopularMoviesEvent(
      FetchPopularMoviesEvent event, Emitter<PopularMoviesState> emit) async {
    emit(PopularMoviesLoading());
    try {
      final movies = await getPopularMovies();
      emit(PopularMoviesLoaded(movies: movies));
    } catch (e) {
      emit(PopularMoviesError(
          message: ' edi ra babu erroruuu : ${e.toString()}'));
    }
  }
}
