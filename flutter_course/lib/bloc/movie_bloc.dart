import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api_service.dart';

abstract class MovieEvent {}

class LoadMovieEvent extends MovieEvent {}

class AddToBookmarkEvent extends MovieEvent {
  final int movieId;

  AddToBookmarkEvent(this.movieId);
}

class DeleteFromBookmarkEvent extends MovieEvent {
  final int movieId;

  DeleteFromBookmarkEvent(this.movieId);
}


abstract class MovieState {}

class MovieInitialState extends MovieState {}

class MovieLoadingState extends MovieState {}

class MovieErrorState extends MovieState {
  final String message;

  MovieErrorState(this.message);
}

class MovieLoadedState extends MovieState {
  MovieLoadedState({
    this.movies = const [],
    this.favoritesId = const {},
  });

  final List<dynamic>? movies;
  Set<int> favoritesId = {};

  MovieLoadedState copyWith({
    List<dynamic>? movies,
    Set<int>? favoritesId,

  }) {
    return MovieLoadedState(
      movies: movies ?? this.movies,
      favoritesId: favoritesId ?? this.favoritesId,
    );
  }
}

Set<int> toSet(Set<String> strings) {
  return strings.fold<Set<int>>(<int>{}, (previousValue, value) {
    final parsed = int.tryParse(value);
    if (parsed != null) {
      previousValue.add(parsed);
    }
    return previousValue;
  });
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc({
    required ApiService service,
    required SharedPreferences storage,
  }) : super(MovieInitialState()) {
    on<LoadMovieEvent>((
        LoadMovieEvent event,
        Emitter<MovieState> emit,
        ) async {
      emit(MovieLoadingState());
      try {
        final movies = await service.getMovies();

        final Set<int> favorites = toSet(Set.of((storage.getString('favorites') ?? '').split(';')));


        emit(MovieLoadedState(
          movies: movies.result!,
          favoritesId: favorites,
        ));
      } catch (e) {
        emit(MovieErrorState(e.toString()));
      }
    });

    on<AddToBookmarkEvent>((
        AddToBookmarkEvent event,
        Emitter<MovieState> emit,
        ) async {
      if (state is MovieLoadedState) {
        Set<int> next =  Set.from((state as MovieLoadedState).favoritesId);
        next.add(event.movieId);
        await storage.setString('favorites', next.join(';'));
        emit((state as MovieLoadedState).copyWith(favoritesId: next));
      }
    });

    on<DeleteFromBookmarkEvent>((
        DeleteFromBookmarkEvent event,
        Emitter<MovieState> emit,
        ) async {
      if (state is MovieLoadedState) {
        Set<int> next = Set.from((state as MovieLoadedState).favoritesId);
        next.remove(event.movieId);

        await storage.setString('favorites', next.join(';'));
        emit((state as MovieLoadedState).copyWith(favoritesId: next));
      }
    });
  }
}
