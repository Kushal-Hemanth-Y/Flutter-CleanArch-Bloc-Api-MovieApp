import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie_tdd_bloc/data/datasources/movie_remote_data_source.dart';
import 'package:movie_tdd_bloc/data/models/movie_model.dart';

import '../../../core/error/server_exception.dart';

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final http.Client client;

  MovieRemoteDataSourceImpl({required this.client});

  // ignore: constant_identifier_names
  static const BASE_URL = 'https://api.themoviedb.org/3/';
  // ignore: constant_identifier_names
  static const API_KEY = 'bbef0c48021424f6fa1f980bd4fe4c1f';
  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final response =
        await client.get(Uri.parse("$BASE_URL/movie/popular?api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await client
        .get(Uri.parse("$BASE_URL/trending/movie/day??api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MovieModel>> searchMovies(String query) async {
    final response = await client.get(
        Uri.parse("$BASE_URL/seaarch/movie?query=$query&api_key=$API_KEY"));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      final List<MovieModel> movies = (responseBody['results'] as List)
          .map((movie) => MovieModel.fromJson(movie))
          .toList();
      return movies;
    } else {
      throw ServerException();
    }
  }
}
