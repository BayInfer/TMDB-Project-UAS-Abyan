import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:last/injector.dart';
import 'package:last/movie/providers/movie_get_now_playing_provider.dart';
import 'package:last/movie/providers/movie_get_top_rated_provider.dart';
import 'package:provider/provider.dart';
import 'package:last/app_constants.dart';
import 'package:last/movie/pages/movie_page.dart';
import 'package:last/movie/providers/movie_get_discover_provider.dart';
import 'package:last/movie/repositories/movie_repository.dart';
import 'package:last/movie/repositories/movie_repository_impl.dart';



void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();
  runApp(App());
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key,});




  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetDiscoverProvider>()
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetTopRatedProvider>()
        ),
        ChangeNotifierProvider(
          create: (_) => sl<MovieGetNowPlayingProvider>()
        ),
      ],
      child: MaterialApp(
      title: 'VORFILM',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const MoviePage(),
      debugShowCheckedModeBanner: false,
    ),
    );
  }
}

