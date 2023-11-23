import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../domain/entities/movie.dart';
import '../../../domain/usecases/search_movies.dart';

part 'search_movies_event.dart';
part 'search_movies_state.dart';

class SearchMoviesBloc extends Bloc<SearchMoviesEvent, SearchMoviesState> {
  final SearchMovies searchMovies;
  SearchMoviesBloc({required this.searchMovies})
      : super(SearchMoviesInitial()) {
    on<FetchSearchMovies>(fetchSearchMovies);
  }

  FutureOr<void> fetchSearchMovies(
      FetchSearchMovies event, Emitter<SearchMoviesState> emit) async {
    emit(SearchMoviesLoading());
    try {
      final searchResult = await searchMovies(event.query);
      emit(SearchMoviesLoaded(movies: searchResult));
    } catch (e) {
      emit(SearchMoviesError(message: e.toString()));
    }
  }
}
