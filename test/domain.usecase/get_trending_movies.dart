import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movie_tdd_bloc/domain/entities/movie.dart';
import 'package:movie_tdd_bloc/domain/repositories/movie_repository.dart';
import 'package:movie_tdd_bloc/domain/usecases/get_trending_movies.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late GetTrendingMovies usecase;
  MockMovieRepository mockMovieRepository;
  setUp(() {
    mockMovieRepository = MockMovieRepository();
    usecase =
        GetTrendingMovies(mockMovieRepository, repository: mockMovieRepository);
  });

  final tMoviesList = [
    Movie(
        id: 1,
        title: 'Test Movie 1',
        overview: 'Desc 1',
        posterpath: '/image1'),
    Movie(
        id: 2,
        title: 'Test Movie 2',
        overview: 'Desc 2',
        posterpath: '/image2'),
  ];
  test('should get trending movies from repository', () async {
    when(mockMovieRepository.getTrendingMovies())
        .thenAnswer((_) async => tMoviesList);

    final result = await usecase();

    expect(result, tMoviesList);
    verify(mockMovieRepository.getTrendingMovies());
    verifyNoMoreInteractions(mockMovieRepository);
  });
}
