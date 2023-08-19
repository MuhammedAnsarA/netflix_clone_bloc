import 'package:flutter/material.dart';
import 'package:netflix_bloc/application/downloads/downloads_bloc.dart';
import 'package:netflix_bloc/application/search/search_bloc.dart';
import 'package:netflix_bloc/core/colors.dart';
import 'package:netflix_bloc/domain/core/di/injectable.dart';
import 'package:netflix_bloc/presentation/main_page/screen_main_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (ctx) => getIt<DownloadsBloc>()),
        BlocProvider(create: (ctx) => getIt<SearchBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          scaffoldBackgroundColor: backgroundColor,
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
              bodyLarge: TextStyle(color: Colors.white),
              bodyMedium: TextStyle(color: Colors.white)),
        ),
        home: ScreenMainPage(),
      ),
    );
  }
}
