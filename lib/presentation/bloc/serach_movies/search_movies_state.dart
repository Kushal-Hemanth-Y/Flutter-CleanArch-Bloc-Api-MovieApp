part of 'search_movies_bloc.dart';

abstract class SearchMoviesState extends Equatable {
  const SearchMoviesState();

  @override
  List<Object> get props => [];
}

class SearchMoviesInitial extends SearchMoviesState {}

class SearchMoviesLoading extends SearchMoviesState {}

class SearchMoviesLoaded extends SearchMoviesState {
  final List<Movie> movies;

  const SearchMoviesLoaded({required this.movies});
}

class SearchMoviesError extends SearchMoviesState {
  final String message;

  const SearchMoviesError({required this.message});
}
