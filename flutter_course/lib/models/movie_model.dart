class MovieModel {
  List<Docs>? docs;
  int? total;
  int? limit;
  int? page;
  int? pages;

  MovieModel({this.docs, this.total, this.limit, this.page, this.pages});

  MovieModel.fromJson(Map<String, dynamic> json) {
    if (json['docs'] != null) {
      docs = <Docs>[];
      json['docs'].forEach((v) {
        docs!.add(Docs.fromJson(v));
      });
    }
    total = json['total'];
    limit = json['limit'];
    page = json['page'];
    pages = json['pages'];
  }


}

class Docs {
  Logo? logo;
  Poster? poster;
  int? movieLength;
  int? id;
  String? type;
  String? name;
  String? description;
  int? year;
  String? alternativeName;
  String? enName;
  List<Names>? names;
  String? shortDescription;
  String? color;
  bool? isFavorite;

  Docs(
      { this.logo,
        this.poster,
        this.movieLength,
        this.id,
        this.type,
        this.name,
        this.description,
        this.year,
        this.alternativeName,
        this.enName,
        this.names,
        this.shortDescription,
        this.color});

  Docs.fromJson(Map<String, dynamic> json) {
    logo = json['logo'] != null ? Logo.fromJson(json['logo']) : null;
    poster =
    json['poster'] != null ?  Poster.fromJson(json['poster']) : null;
    movieLength = json['movieLength'];
    id = json['id'];
    type = json['type'];
    name = json['name'];
    description = json['description'];
    year = json['year'];
    alternativeName = json['alternativeName'];
    enName = json['enName'];
    if (json['names'] != null) {
      names = <Names>[];
      json['names'].forEach((v) {
        names!.add(Names.fromJson(v));
      });
    }
    shortDescription = json['shortDescription'];
    color = json['color'];
  }

}

class Logo {
  String? sId;
  String? url;

  Logo({this.sId, this.url});

  Logo.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
  }

}

class Poster {
  String? sId;
  String? url;
  String? previewUrl;

  Poster({this.sId, this.url, this.previewUrl});

  Poster.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    url = json['url'];
    previewUrl = json['previewUrl'];
  }


}

class Rating {
  String? sId;
  double? kp;
  double? imdb;
  double? filmCritics;
  double? russianFilmCritics;
  double? await;

  Rating(
      {this.sId,
        this.kp,
        this.imdb,
        this.filmCritics,
        this.russianFilmCritics,
        this.await});

  Rating.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    kp = json['kp'];
    imdb = json['imdb'];
    filmCritics = json['filmCritics'];
    russianFilmCritics = json['russianFilmCritics'];
    await = json['await'];
  }


}

class Votes {
  String? sId;
  int? kp;
  int? imdb;
  int? filmCritics;
  int? russianFilmCritics;
  int? await;

  Votes(
      {this.sId,
        this.kp,
        this.imdb,
        this.filmCritics,
        this.russianFilmCritics,
        this.await});

  Votes.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    kp = json['kp'];
    imdb = json['imdb'];
    filmCritics = json['filmCritics'];
    russianFilmCritics = json['russianFilmCritics'];
    await = json['await'];
  }

}

class Names {
  String? sId;
  String? name;

  Names({this.sId, this.name});

  Names.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

}