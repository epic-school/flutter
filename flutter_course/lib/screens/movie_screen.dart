import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import '../bloc/movie_bloc.dart';
import '../models/movie_model.dart';

import '../api_service.dart';
import '../enums.dart';
import '../theme/navigator_bar.dart';
import '../theme/theme.dart';
import 'review_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MoviesScreenState();

}


class _MoviesScreenState extends State<MovieScreen> {



  final ApiService service = ApiServiceDio.instance;
  var state = ContentState.initial;
  final movies = <Docs>[];

  Future<void> load() async {
    setState(() {
      state = ContentState.loading;
    });
    final response = await service.getMovies();
    if (response.hasError) {
      setState(() {
        state = ContentState.failure;
        movies.clear();
      });
    } else {
      setState(() {
        state = response.result!.isNotEmpty
            ? ContentState.success
            : ContentState.empty;
        movies
          ..clear()
          ..addAll(response.result!);
      });
    }
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeState = context.watch<ThemeState>();
    return BlocBuilder<MovieBloc, MovieState>(
        bloc: GetIt.I.get<MovieBloc>(),
    builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              iconTheme: Theme.of(context).primaryIconTheme,
              title: Text(
                "Кинопремьеры",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              actions: [
                Switch(
                  value: themeState.isDark,
                  onChanged: (value) {
                    if (value) {
                        themeState.setDarkTheme();
                    } else {
                        themeState.setLightTheme();
                    }
                  },
                ),
              ],
          ),
          drawer:   NavBar(),


            body: const _MoviesView(),
        );
      }
    );
  }
}

class _MoviesView extends StatelessWidget {

  const _MoviesView({
    Key? key
  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      bloc: GetIt.I.get<MovieBloc>(),
      builder: (context, state) {
        if (state is MovieInitialState ||
            state is MovieLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is MovieErrorState) {
          return Text( state.message,
          );
        }

        if (state is MovieLoadedState) {
          final favorites = state.favoritesId
              .toList();
          final items = state.movies;

          if (items?.isEmpty??false) {
            return const Center(
              child: Text(
                'Список пуст',
                style: TextStyle(fontSize: 20),
              ),
            );
          } else {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: items?.length,
              itemBuilder: (context, i) => ListTile(
                title: Row( children: [
                  ClipRRect(
                  borderRadius: BorderRadius.circular(26),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.network(
                    items?[i].poster?.previewUrl,
                    width: 70,
                    height: 250,
                    ),
                  ),
                ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(items?[i].name??'',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(items?[i].description??'',
                          style: Theme.of(context).textTheme.subtitle1,
                          maxLines: 7,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      favorites.contains(items?[i].id) ? Icons.favorite : Icons.favorite_border,
                      size: 30,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  onPressed: () {
                      final bloc = GetIt.I.get<MovieBloc>();
                      if (items?[i].id != null) {
                        if (favorites.contains(items?[i].id) ) {
                          bloc.add(DeleteFromBookmarkEvent(items?[i].id as int));
                        } else {
                          bloc.add(AddToBookmarkEvent(items?[i].id as int));
                        }
                      }
        },
        ),



                    ],
                ),


                onTap:  () {
                  navKey.currentState!.push(
                    MaterialPageRoute(
                      builder: (context) =>   ReviewScreen(movieId: items?[i].id??1),
                    ),
                  );
                },
              ),
            );
          }
        }

        return Container();
      },
    );
  }
}
