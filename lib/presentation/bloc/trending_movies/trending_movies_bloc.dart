import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:movie_tdd_bloc/domain/usecases/get_trending_movies.dart';

import '../../../domain/entities/movie.dart';
import 'package:dartz/dartz.dart';

part 'trending_movies_event.dart';
part 'trending_movies_state.dart';

class TrendingMoviesBloc
    extends Bloc<TrendingMoviesEvent, TrendingMoviesState> {
  final GetTrendingMovies getTrendingMovies;
  TrendingMoviesBloc({required this.getTrendingMovies})
      : super(TrendingMoviesInitial()) {
    on<FetchTrendingMoviesEvent>(fetchTrendingMoviesEvent);
  }

  FutureOr<void> fetchTrendingMoviesEvent(
      FetchTrendingMoviesEvent event, Emitter<TrendingMoviesState> emit) async {
    emit(TrendingMoviesLoading());
    try {
      final movies = await getTrendingMovies();
      emit(TrendingMoviesLoaded(movies));
    } catch (e) {
      emit(TrendingMoviesError(message: e.toString()));
    }
  }
}
