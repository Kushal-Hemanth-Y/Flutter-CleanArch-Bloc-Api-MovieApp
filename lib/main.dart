import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_tdd_bloc/presentation/bloc/popular_movies/popular_movies_bloc.dart';
import 'package:movie_tdd_bloc/presentation/pages/popular_movies_screen.dart';

import 'injection_container.dart';

void main() {
  init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movies App',
      theme: ThemeData(
          fontFamily: GoogleFonts.poppins().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black54)),
      home: BlocProvider(
        create: (context) =>
            getIt<PopularMoviesBloc>()..add(FetchPopularMoviesEvent()),
        child: const PopularMoviesScreen(),
      ),
    );
  }
}
