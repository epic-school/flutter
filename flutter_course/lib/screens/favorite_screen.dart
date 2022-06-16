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




class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();

}


class _FavoriteScreenState extends State<FavoriteScreen> {

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
              title: Text(
                "Избранное",
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
            drawer: NavBar(),
            body: const _FavoriteView(),
          );
        }
    );
  }
}

class _FavoriteView extends StatelessWidget {

  const _FavoriteView({
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
            final items = state.movies
                ?.where((bk) => state.favoritesId.contains(bk.id))
                .toList();
            if (items?.isEmpty??false) {
              return  Center(
                child: Text(
                  'Список Избранные пуст',
                    style: Theme.of(context).textTheme.subtitle1,
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
                          Text(items?[i].name??'Без названия',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          Text(items?[i].description??'Без описания',
                            style: Theme.of(context).textTheme.subtitle1,
                            maxLines: 7,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        items?[i].isFavorite??false ? Icons.favorite : Icons.favorite_border,
                        size: 30,
                        color: Theme.of(context).iconTheme.color,

                      ),
                      onPressed: () {
                        final bloc = GetIt.I.get<MovieBloc>();
                        if (items?[i].id != null) {
                          if (items?[i].isFavorite??false) {
                            bloc.add(DeleteFromBookmarkEvent(items?[i].id as int));
                            items?[i].isFavorite=false;
                          } else {
                            bloc.add(AddToBookmarkEvent(items?[i].id as int));
                            items?[i].isFavorite=true;
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
